Content-Type: multipart/mixed; boundary="===============9220341818103290308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] qed: qed_abs_ppfid() can be static
Date: Fri, 28 May 2021 12:34:58 +0800
Message-ID: <20210528043458.GA129772@42777646ca86>
In-Reply-To: <20210527235902.2185-13-smalin@marvell.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9220341818103290308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

drivers/net/ethernet/qlogic/qed/qed_dev.c:5383:5: warning: symbol 'qed_abs_=
ppfid' was not declared. Should it be static?
drivers/net/ethernet/qlogic/qed/qed_dev.c:5400:6: warning: symbol 'qed_llh_=
clear_ppfid_filters' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 qed_dev.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethern=
et/qlogic/qed/qed_dev.c
index 2ed9a8ab9dce0..4af5c229c61a3 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -5380,7 +5380,7 @@ static int qed_llh_shadow_remove_all_filters(struct q=
ed_dev *cdev, u8 ppfid)
 	return 0;
 }
 =

-int qed_abs_ppfid(struct qed_dev *cdev, u8 rel_ppfid, u8 *p_abs_ppfid)
+static int qed_abs_ppfid(struct qed_dev *cdev, u8 rel_ppfid, u8 *p_abs_ppf=
id)
 {
 	struct qed_llh_info *p_llh_info =3D cdev->p_llh_info;
 =

@@ -5397,7 +5397,7 @@ int qed_abs_ppfid(struct qed_dev *cdev, u8 rel_ppfid,=
 u8 *p_abs_ppfid)
 	return 0;
 }
 =

-void qed_llh_clear_ppfid_filters(struct qed_dev *cdev, u8 ppfid)
+static void qed_llh_clear_ppfid_filters(struct qed_dev *cdev, u8 ppfid)
 {
 	struct qed_hwfn *p_hwfn =3D QED_LEADING_HWFN(cdev);
 	struct qed_ptt *p_ptt =3D qed_ptt_acquire(p_hwfn);
--===============9220341818103290308==--

