Content-Type: multipart/mixed; boundary="===============4839800434997874767=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-stable-rc:linux-4.19.y 9781/9999] drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:321:39: sparse: sparse: cast to restricted __le16
Date: Tue, 11 Feb 2020 09:53:12 +0800
Message-ID: <202002110909.QepTCnxa%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4839800434997874767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.19.y
head:   f03ffd764aed19a09925f1d0e2df9241fdafbcc4
commit: 2c00f819a72150708b9f9e0a2b031a8fdafa7b15 [9781/9999] iwlwifi: Don't=
 ignore the cap field upon mcc update
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-162-g98276e61-dirty
        git checkout 2c00f819a72150708b9f9e0a2b031a8fdafa7b15
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/net/wireless/intel/iwlwifi/mvm/..//fw/file.h:286:19: sparse: spa=
rse: mixed bitwiseness
   drivers/net/wireless/intel/iwlwifi/mvm/..//fw/file.h:405:19: sparse: spa=
rse: mixed bitwiseness
>> drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c:321:39: sparse: sparse=
: cast to restricted __le16

vim +321 drivers/net/wireless/intel/iwlwifi/mvm/mac80211.c

   287	=

   288	struct ieee80211_regdomain *iwl_mvm_get_regdomain(struct wiphy *wiph=
y,
   289							  const char *alpha2,
   290							  enum iwl_mcc_source src_id,
   291							  bool *changed)
   292	{
   293		struct ieee80211_regdomain *regd =3D NULL;
   294		struct ieee80211_hw *hw =3D wiphy_to_ieee80211_hw(wiphy);
   295		struct iwl_mvm *mvm =3D IWL_MAC80211_GET_MVM(hw);
   296		struct iwl_mcc_update_resp *resp;
   297	=

   298		IWL_DEBUG_LAR(mvm, "Getting regdomain data for %s from FW\n", alpha=
2);
   299	=

   300		lockdep_assert_held(&mvm->mutex);
   301	=

   302		resp =3D iwl_mvm_update_mcc(mvm, alpha2, src_id);
   303		if (IS_ERR_OR_NULL(resp)) {
   304			IWL_DEBUG_LAR(mvm, "Could not get update from FW %d\n",
   305				      PTR_ERR_OR_ZERO(resp));
   306			goto out;
   307		}
   308	=

   309		if (changed) {
   310			u32 status =3D le32_to_cpu(resp->status);
   311	=

   312			*changed =3D (status =3D=3D MCC_RESP_NEW_CHAN_PROFILE ||
   313				    status =3D=3D MCC_RESP_ILLEGAL);
   314		}
   315	=

   316		regd =3D iwl_parse_nvm_mcc_info(mvm->trans->dev, mvm->cfg,
   317					      __le32_to_cpu(resp->n_channels),
   318					      resp->channels,
   319					      __le16_to_cpu(resp->mcc),
   320					      __le16_to_cpu(resp->geo_info),
 > 321					      __le16_to_cpu(resp->cap));
   322		/* Store the return source id */
   323		src_id =3D resp->source_id;
   324		kfree(resp);
   325		if (IS_ERR_OR_NULL(regd)) {
   326			IWL_DEBUG_LAR(mvm, "Could not get parse update from FW %d\n",
   327				      PTR_ERR_OR_ZERO(regd));
   328			goto out;
   329		}
   330	=

   331		IWL_DEBUG_LAR(mvm, "setting alpha2 from FW to %s (0x%x, 0x%x) src=
=3D%d\n",
   332			      regd->alpha2, regd->alpha2[0], regd->alpha2[1], src_id);
   333		mvm->lar_regdom_set =3D true;
   334		mvm->mcc_src =3D src_id;
   335	=

   336	out:
   337		return regd;
   338	}
   339	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4839800434997874767==--

