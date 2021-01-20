Content-Type: multipart/mixed; boundary="===============7878625933069585478=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH bcache] bcache: journal_nvm_base() can be static
Date: Thu, 21 Jan 2021 01:47:46 +0800
Message-ID: <20210120174746.GA714@72b378e388f9>
In-Reply-To: <202101210134.tTU8ANPo-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7878625933069585478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 journal.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/bcache/journal.c b/drivers/md/bcache/journal.c
index e73f3d6b43f2241..87355a55c862955 100644
--- a/drivers/md/bcache/journal.c
+++ b/drivers/md/bcache/journal.c
@@ -1055,7 +1055,7 @@ int bch_journal_alloc(struct cache_set *c)
 	return 0;
 }
 =

-void *journal_nvm_base(struct bch_extent *list, struct cache *ca)
+static void *journal_nvm_base(struct bch_extent *list, struct cache *ca)
 {
 	void *ret =3D NULL;
 	struct jset *jset;
@@ -1074,7 +1074,7 @@ void *journal_nvm_base(struct bch_extent *list, struc=
t cache *ca)
 	return ret;
 }
 =

-void bch_release_nvm_extent_list(struct bch_extent *list)
+static void bch_release_nvm_extent_list(struct bch_extent *list)
 {
 	struct bch_extent *ext;
 	struct list_head *cur, *next;
@@ -1085,7 +1085,7 @@ void bch_release_nvm_extent_list(struct bch_extent *l=
ist)
 	}
 }
 =

-void *get_nvdimm_journal_space(struct cache *ca)
+static void *get_nvdimm_journal_space(struct cache *ca)
 {
 	struct bch_extent *allocated_list =3D NULL;
 	void *ret =3D NULL;
--===============7878625933069585478==--

