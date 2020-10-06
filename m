Content-Type: multipart/mixed; boundary="===============2042312056298162974=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 13152/13159] drivers/gpu/drm/i915/gt/shmem_utils.c:76 shmem_pin_map() warn: always true condition '(--i >= 0) => (0-u64max >= 0)'
Date: Tue, 06 Oct 2020 09:55:41 +0200
Message-ID: <20201006075541.GA10243@lst.de>
In-Reply-To: <202010040517.GzLE38rk-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2042312056298162974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the report.  The patch below takes care of it, and also
uses the right type for a page index.  Andrew, can you fold it in?

diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/g=
t/shmem_utils.c
index f011ea42487e11..4f043f2520f78d 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -52,7 +52,7 @@ struct file *shmem_create_from_object(struct drm_i915_gem=
_object *obj)
 void *shmem_pin_map(struct file *file)
 {
 	struct page **pages;
-	size_t n_pages, i;
+	pgoff_t n_pages, i, j;
 	void *vaddr;
 =

 	n_pages =3D file->f_mapping->host->i_size >> PAGE_SHIFT;
@@ -73,8 +73,8 @@ void *shmem_pin_map(struct file *file)
 	mapping_set_unevictable(file->f_mapping);
 	return vaddr;
 err_page:
-	while (--i >=3D 0)
-		put_page(pages[i]);
+	for (j =3D 0; j < i; j++)
+		put_page(pages[j]);
 	kvfree(pages);
 	return NULL;
 }
--===============2042312056298162974==--

