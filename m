Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66E110E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 01:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693530498; x=1725066498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0+a4gXaqJuZj+5qcR5PgSlqq3maGpFkSh4OPOuWvk0=;
  b=QpBdT95iGGD2I5wnQfrbXwnLk10N/EFUgM36lhTB8ge71Xkd6npwyiKh
   Z5i6igvTKcJ8/MsWv1n4+biPm4Q7zthgR+GY6ziaeBPkrPSAk+Z0eypRo
   +OAVRXRVcxGSvaBYPWiNuny1erqU5vMs8gzGnMRlQBT3Z6ebm4mntka/e
   r6mzTNedtQSEFLK4fLb9gfUqWlmE12U+6q7fN7AJG2W3Q6VW4XZUvvLNQ
   aS7fQLSs5Pu20bEeEC+jg9KEkraBwD6D7BDvKch6lLybiY9N3UyoMriY4
   Rg+efmneMwxCLQuWdgcc/6ZAqcU0ndlNhh8zr5ZA/n6BCsnPEJKQfHBpP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361131325"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="361131325"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 18:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774811766"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="774811766"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2023 18:08:14 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbsdw-0000iC-1P;
	Fri, 01 Sep 2023 01:08:12 +0000
Date: Fri, 1 Sep 2023 09:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>,
	"Zawawi, Muhammad Zul Husni" <muhammad.zul.husni.zawawi@intel.com>
Subject: [intel-lts:6.1/linux 2330/2351]
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c:62:41: sparse: sparse: incorrect
 type in assignment (different base types)
Message-ID: <202309010957.Iwwk16Jp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   bcf6f14318c852a7319cf3ebeb0978432e314c0e
commit: 85100d7dd55aadd743fc1fb5ca298a702d98fc4e [2330/2351] drm/i915/huc: load HuC via non-POR GSC engine flow
config: i386-randconfig-062-20230901 (https://download.01.org/0day-ci/archive/20230901/202309010957.Iwwk16Jp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010957.Iwwk16Jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010957.Iwwk16Jp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c:62:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] huc_base_address @@     got unsigned long long [usertype] start @@
   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c:62:41: sparse:     expected restricted __le64 [usertype] huc_base_address
   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c:62:41: sparse:     got unsigned long long [usertype] start

vim +62 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c

    26	
    27	int intel_huc_fw_load_and_auth_via_gsc_cs(struct intel_huc *huc)
    28	{
    29		struct intel_gt *gt = huc_to_gt(huc);
    30		struct drm_i915_private *i915 = gt->i915;
    31		struct drm_i915_gem_object *obj;
    32		struct mtl_huc_load_msg_in *msg_in;
    33		struct mtl_huc_load_msg_out *msg_out;
    34		void *pkt_vaddr;
    35		u64 pkt_offset;
    36		int retry = 5;
    37		int err = 0;
    38	
    39		if (!huc->heci_pkt)
    40			return -ENODEV;
    41	
    42		obj = huc->heci_pkt->obj;
    43		pkt_offset = i915_ggtt_offset(huc->heci_pkt);
    44	
    45		pkt_vaddr = i915_gem_object_pin_map_unlocked(obj,
    46							     i915_coherent_map_type(i915, obj, true));
    47		if (IS_ERR(pkt_vaddr))
    48			return PTR_ERR(pkt_vaddr);
    49	
    50		msg_in = pkt_vaddr;
    51		msg_out = pkt_vaddr + SZ_4K;
    52	
    53		intel_gsc_uc_heci_cmd_emit_mtl_header(&msg_in->header,
    54						      HECI_MEADDRESS_PXP,
    55						      sizeof(*msg_in), 0);
    56	
    57		msg_in->huc_in.header.api_version = PXP_APIVER(4, 3);
    58		msg_in->huc_in.header.command_id = PXP43_CMDID_START_HUC_AUTH;
    59		msg_in->huc_in.header.status = 0;
    60		msg_in->huc_in.header.buffer_len = sizeof(msg_in->huc_in) -
    61						   sizeof(msg_in->huc_in.header);
  > 62		msg_in->huc_in.huc_base_address = huc->fw.vma_res.start;
    63	
    64		do {
    65			err = intel_gsc_uc_heci_cmd_submit_packet(&gt->uc.gsc,
    66								  pkt_offset, sizeof(*msg_in),
    67								  pkt_offset + SZ_4K, SZ_4K);
    68			if (err) {
    69				huc_err(huc, "failed to submit GSC request to auth: %d\n", err);
    70				goto out_unpin;
    71			}
    72	
    73			if (msg_out->header.flags & GSC_OUTFLAG_MSG_PENDING) {
    74				msg_in->header.gsc_message_handle = msg_out->header.gsc_message_handle;
    75				err = -EBUSY;
    76				msleep(50);
    77			}
    78		} while (--retry && err == -EBUSY);
    79	
    80		if (err)
    81			goto out_unpin;
    82	
    83		if (msg_out->header.message_size != sizeof(*msg_out)) {
    84			huc_err(huc, "invalid GSC reply length %u [expected %zu]\n",
    85				msg_out->header.message_size, sizeof(*msg_out));
    86			err = -EPROTO;
    87			goto out_unpin;
    88		}
    89	
    90		/*
    91		 * The GSC will return PXP_STATUS_OP_NOT_PERMITTED if the HuC is already
    92		 * loaded. If the same error is ever returned with HuC not loaded we'll
    93		 * still catch it when we check the authentication bit later.
    94		 */
    95		if (msg_out->huc_out.header.status != PXP_STATUS_SUCCESS &&
    96		    msg_out->huc_out.header.status != PXP_STATUS_OP_NOT_PERMITTED) {
    97			huc_err(huc, "load failed with GSC error = 0x%x\n",
    98				msg_out->huc_out.header.status);
    99			err = -EIO;
   100			goto out_unpin;
   101		}
   102	
   103		/*
   104		 * in the non-POR flow, the GSC re-uses the same regs as GuC (like on
   105		 * DG2)
   106		 */
   107		err = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
   108	
   109	out_unpin:
   110		i915_gem_object_unpin_map(obj);
   111		return err;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
