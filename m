Content-Type: multipart/mixed; boundary="===============4697863538386730814=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] i40e/vf_migration: i40e_vf_release() can be static
Date: Mon, 18 May 2020 16:49:48 +0800
Message-ID: <20200518084948.GA20741@d36dc192edac>
In-Reply-To: <20200518025316.14491-1-yan.y.zhao@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4697863538386730814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 i40e_vf_migration.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_vf_migration.c b/drivers/=
net/ethernet/intel/i40e/i40e_vf_migration.c
index 96026dcf5c9df..d222c7531fa6e 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_vf_migration.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_vf_migration.c
@@ -51,7 +51,7 @@ static int i40e_vf_open(void *device_data)
 	return ret;
 }
 =

-void i40e_vf_release(void *device_data)
+static void i40e_vf_release(void *device_data)
 {
 	struct i40e_vf_migration *i40e_vf_dev =3D
 		vfio_pci_vendor_data(device_data);
@@ -105,7 +105,7 @@ static struct vfio_device_ops i40e_vf_device_ops_node =
=3D {
 	.request	=3D i40e_vf_request,
 };
 =

-void *i40e_vf_probe(struct pci_dev *pdev)
+static void *i40e_vf_probe(struct pci_dev *pdev)
 {
 	struct i40e_vf_migration *i40e_vf_dev =3D NULL;
 	struct pci_dev *pf_dev, *vf_dev;
--===============4697863538386730814==--

