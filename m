Content-Type: multipart/mixed; boundary="===============9177240158034420622=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] vfio: vfio_vaddr_valid() can be static
Date: Wed, 06 Jan 2021 04:03:53 +0800
Message-ID: <20210105200353.GA77614@f127c8abdc20>
In-Reply-To: <1609861013-129801-6-git-send-email-steven.sistare@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9177240158034420622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 vfio_iommu_type1.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type=
1.c
index cc9b61d8b57bab..697e661f8295f8 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -500,7 +500,7 @@ static bool vfio_iommu_contained(struct vfio_iommu *iom=
mu)
 }
 =

 =

-bool vfio_vaddr_valid(struct vfio_iommu *iommu, struct vfio_dma *dma)
+static bool vfio_vaddr_valid(struct vfio_iommu *iommu, struct vfio_dma *dm=
a)
 {
 	while (dma->suspended) {
 		mutex_unlock(&iommu->lock);
--===============9177240158034420622==--

