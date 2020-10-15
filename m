Content-Type: multipart/mixed; boundary="===============1719371815239779614=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/i915: intel_dp_get_pcon_dsc_cap() can be static
Date: Thu, 15 Oct 2020 22:19:26 +0800
Message-ID: <20201015141926.GA86504@4663f5aaaa99>
In-Reply-To: <20201015105259.27934-12-ankit.k.nautiyal@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1719371815239779614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 intel_dp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915=
/display/intel_dp.c
index b4f8abaea60772..410b3932d7ae24 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3882,7 +3882,7 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(dev_priv, intel_dp->output_reg);
 }
 =

-void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
+static void intel_dp_get_pcon_dsc_cap(struct intel_dp *intel_dp)
 {
 	u8 buf;
 	u8 rc_buf_blk_size;
--===============1719371815239779614==--

