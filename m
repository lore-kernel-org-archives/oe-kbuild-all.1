Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6BB238C1F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768805299; cv=none; b=QgxDfLzLyIbCMEnVPRCXMxFBvDo0JMj9CvjV1yeE361PrPtiMFK3fob7D1Uy7T4uZjTChTpEo7mbPKmP2U8kwpNFfduBSrxnVmC5WF/hMkSPfApycEHYT6gepVjNkxDgowQhP1YOhCEy3th2JMDXawunpDa6veK+sc0p6pmcub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768805299; c=relaxed/simple;
	bh=5qSfbHjITC3CZoxlzcQ3bPc2u4fwdnDNpRFgbf65mao=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eLnsuIc2DtsZuVs+6D/S4f4MB9IFGclTj1tvUy5AI9a9ue2D0uECmYt6+hrp7ftrZq/6ZDjGRJNhcaO6/6NuE6Jie2YKpFV3x7jvAHt0NdX7FCT+Dq/UKK1CM5PB1LFq+fGzE6NYShKk1dy2uTYFkVFz45lYatCfeYH5OiI7SGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XiY4XBw2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiY4XBw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768805297; x=1800341297;
  h=date:from:to:cc:subject:message-id;
  bh=5qSfbHjITC3CZoxlzcQ3bPc2u4fwdnDNpRFgbf65mao=;
  b=XiY4XBw2d3yid21F8JNgsALrO6VH82UmVw32yJ7NEXKHQmB3gbjDJQ1y
   7XNtMmFdKt/lwy9RboTIWCIihGPyVEewdn+TN0zfmA4GbduTMwPsxG5IO
   gABD8g01mnNW0l20ULQtCS1MWXkbhXANybUpobnG6o3vJ8q11VZ8rBA+T
   w7xrhS/yM+V3woRtd2/Kar7IvRtm4Q1/R6aS7CG/wYaOG4YuYPLKYl4W5
   anCeToG7jkofKs+umygxGAylgmd6uWAM2bazR3PYKNxF2CkKDzF2geTgJ
   DLrkfq0/uh2KxfI1CRGrsaX0SiS83GVGMwLiqWZZZI4u8ZjuhOyzOLnvD
   A==;
X-CSE-ConnectionGUID: rvmd6RRZQy+Fsa186ZkjLw==
X-CSE-MsgGUID: JGEp+N3DQ8yDf+flcdphAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80310950"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="80310950"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 22:48:17 -0800
X-CSE-ConnectionGUID: jm9u27+hSl6wwzBcmuNsFA==
X-CSE-MsgGUID: S661t+34QyWHM3f/Mo/twQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="204936299"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jan 2026 22:48:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhj3c-00000000NXD-2yh4;
	Mon, 19 Jan 2026 06:48:12 +0000
Date: Mon, 19 Jan 2026 14:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 drivers/usb/gadget/function/f_uac2.c:763 setup_headers() warn: inconsistent
 indenting
Message-ID: <202601191434.8CeFFhfV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: e2c0816af2f2bda618e84ead373a93524d2d037f [196/196] BACKPORT: usb: gadget: f_uac2: add volume and mute support
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601191434.8CeFFhfV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191434.8CeFFhfV-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/f_uac2.c:763 setup_headers() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:923 afunc_validate_opts() warn: inconsistent indenting

Old smatch warnings:
drivers/usb/gadget/function/f_uac2.c:770 setup_headers() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:779 setup_headers() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:926 afunc_validate_opts() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:929 afunc_validate_opts() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:932 afunc_validate_opts() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:937 afunc_validate_opts() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:940 afunc_validate_opts() warn: inconsistent indenting
drivers/usb/gadget/function/f_uac2.c:1148 afunc_bind() warn: missing unwind goto?

vim +763 drivers/usb/gadget/function/f_uac2.c

   716	
   717	static void setup_headers(struct f_uac2_opts *opts,
   718				  struct usb_descriptor_header **headers,
   719				  enum usb_device_speed speed)
   720	{
   721		struct usb_ss_ep_comp_descriptor *epout_desc_comp = NULL;
   722		struct usb_ss_ep_comp_descriptor *epin_desc_comp = NULL;
   723		struct usb_ss_ep_comp_descriptor *epin_fback_desc_comp = NULL;
   724		struct usb_endpoint_descriptor *epout_desc;
   725		struct usb_endpoint_descriptor *epin_desc;
   726		struct usb_endpoint_descriptor *epin_fback_desc;
   727		struct usb_endpoint_descriptor *ep_int_desc;
   728		int i;
   729	
   730		switch (speed) {
   731		case USB_SPEED_FULL:
   732			epout_desc = &fs_epout_desc;
   733			epin_desc = &fs_epin_desc;
   734			epin_fback_desc = &fs_epin_fback_desc;
   735			ep_int_desc = &fs_ep_int_desc;
   736			break;
   737		case USB_SPEED_HIGH:
   738			epout_desc = &hs_epout_desc;
   739			epin_desc = &hs_epin_desc;
   740			epin_fback_desc = &hs_epin_fback_desc;
   741			ep_int_desc = &hs_ep_int_desc;
   742			break;
   743		default:
   744			epout_desc = &ss_epout_desc;
   745			epin_desc = &ss_epin_desc;
   746			epout_desc_comp = &ss_epout_desc_comp;
   747			epin_desc_comp = &ss_epin_desc_comp;
   748			epin_fback_desc = &ss_epin_fback_desc;
   749			epin_fback_desc_comp = &ss_epin_fback_desc_comp;
   750			ep_int_desc = &ss_ep_int_desc;
   751		}
   752	
   753		i = 0;
   754		headers[i++] = USBDHDR(&iad_desc);
   755		headers[i++] = USBDHDR(&std_ac_if_desc);
   756		headers[i++] = USBDHDR(&ac_hdr_desc);
   757		if (EPIN_EN(opts))
   758			headers[i++] = USBDHDR(&in_clk_src_desc);
   759		if (EPOUT_EN(opts)) {
   760			headers[i++] = USBDHDR(&out_clk_src_desc);
   761			headers[i++] = USBDHDR(&usb_out_it_desc);
   762	
 > 763	    if (FUOUT_EN(opts))
   764	      headers[i++] = USBDHDR(out_feature_unit_desc);
   765	  }
   766	
   767		if (EPIN_EN(opts)) {
   768			headers[i++] = USBDHDR(&io_in_it_desc);
   769	
   770	    if (FUIN_EN(opts))
   771	      headers[i++] = USBDHDR(in_feature_unit_desc);
   772	
   773			headers[i++] = USBDHDR(&usb_in_ot_desc);
   774		}
   775	
   776		if (EPOUT_EN(opts))
   777			headers[i++] = USBDHDR(&io_out_ot_desc);
   778	
   779	  if (FUOUT_EN(opts) || FUIN_EN(opts))
   780	      headers[i++] = USBDHDR(ep_int_desc);
   781	
   782	  if (EPOUT_EN(opts)) {
   783			headers[i++] = USBDHDR(&std_as_out_if0_desc);
   784			headers[i++] = USBDHDR(&std_as_out_if1_desc);
   785			headers[i++] = USBDHDR(&as_out_hdr_desc);
   786			headers[i++] = USBDHDR(&as_out_fmt1_desc);
   787			headers[i++] = USBDHDR(epout_desc);
   788			if (epout_desc_comp)
   789				headers[i++] = USBDHDR(epout_desc_comp);
   790	
   791			headers[i++] = USBDHDR(&as_iso_out_desc);
   792	
   793			if (EPOUT_FBACK_IN_EN(opts)) {
   794				headers[i++] = USBDHDR(epin_fback_desc);
   795				if (epin_fback_desc_comp)
   796					headers[i++] = USBDHDR(epin_fback_desc_comp);
   797			}
   798		}
   799	
   800		if (EPIN_EN(opts)) {
   801			headers[i++] = USBDHDR(&std_as_in_if0_desc);
   802			headers[i++] = USBDHDR(&std_as_in_if1_desc);
   803			headers[i++] = USBDHDR(&as_in_hdr_desc);
   804			headers[i++] = USBDHDR(&as_in_fmt1_desc);
   805			headers[i++] = USBDHDR(epin_desc);
   806			if (epin_desc_comp)
   807				headers[i++] = USBDHDR(epin_desc_comp);
   808	
   809			headers[i++] = USBDHDR(&as_iso_in_desc);
   810		}
   811		headers[i] = NULL;
   812	}
   813	
   814	static void setup_descriptor(struct f_uac2_opts *opts)
   815	{
   816		/* patch descriptors */
   817		int i = 1; /* ID's start with 1 */
   818	
   819		if (EPOUT_EN(opts))
   820			usb_out_it_desc.bTerminalID = i++;
   821		if (EPIN_EN(opts))
   822			io_in_it_desc.bTerminalID = i++;
   823		if (EPOUT_EN(opts))
   824			io_out_ot_desc.bTerminalID = i++;
   825		if (EPIN_EN(opts))
   826			usb_in_ot_desc.bTerminalID = i++;
   827		if (FUOUT_EN(opts))
   828			out_feature_unit_desc->bUnitID = i++;
   829		if (FUIN_EN(opts))
   830			in_feature_unit_desc->bUnitID = i++;
   831		if (EPOUT_EN(opts))
   832			out_clk_src_desc.bClockID = i++;
   833		if (EPIN_EN(opts))
   834			in_clk_src_desc.bClockID = i++;
   835	
   836		usb_out_it_desc.bCSourceID = out_clk_src_desc.bClockID;
   837	
   838		if (FUIN_EN(opts)) {
   839			usb_in_ot_desc.bSourceID = in_feature_unit_desc->bUnitID;
   840			in_feature_unit_desc->bSourceID = io_in_it_desc.bTerminalID;
   841		} else {
   842			usb_in_ot_desc.bSourceID = io_in_it_desc.bTerminalID;
   843		}
   844	
   845		usb_in_ot_desc.bCSourceID = in_clk_src_desc.bClockID;
   846		io_in_it_desc.bCSourceID = in_clk_src_desc.bClockID;
   847		io_out_ot_desc.bCSourceID = out_clk_src_desc.bClockID;
   848	
   849		if (FUOUT_EN(opts)) {
   850			io_out_ot_desc.bSourceID = out_feature_unit_desc->bUnitID;
   851			out_feature_unit_desc->bSourceID = usb_out_it_desc.bTerminalID;
   852		} else {
   853			io_out_ot_desc.bSourceID = usb_out_it_desc.bTerminalID;
   854		}
   855	
   856		as_out_hdr_desc.bTerminalLink = usb_out_it_desc.bTerminalID;
   857		as_in_hdr_desc.bTerminalLink = usb_in_ot_desc.bTerminalID;
   858	
   859		iad_desc.bInterfaceCount = 1;
   860		ac_hdr_desc.wTotalLength = cpu_to_le16(sizeof(ac_hdr_desc));
   861	
   862		if (EPIN_EN(opts)) {
   863			u16 len = le16_to_cpu(ac_hdr_desc.wTotalLength);
   864	
   865			len += sizeof(in_clk_src_desc);
   866			len += sizeof(usb_in_ot_desc);
   867	
   868			if (FUIN_EN(opts))
   869				len += in_feature_unit_desc->bLength;
   870	
   871			len += sizeof(io_in_it_desc);
   872			ac_hdr_desc.wTotalLength = cpu_to_le16(len);
   873			iad_desc.bInterfaceCount++;
   874		}
   875		if (EPOUT_EN(opts)) {
   876			u16 len = le16_to_cpu(ac_hdr_desc.wTotalLength);
   877	
   878			len += sizeof(out_clk_src_desc);
   879			len += sizeof(usb_out_it_desc);
   880	
   881			if (FUOUT_EN(opts))
   882				len += out_feature_unit_desc->bLength;
   883	
   884			len += sizeof(io_out_ot_desc);
   885			ac_hdr_desc.wTotalLength = cpu_to_le16(len);
   886			iad_desc.bInterfaceCount++;
   887		}
   888	
   889		setup_headers(opts, fs_audio_desc, USB_SPEED_FULL);
   890		setup_headers(opts, hs_audio_desc, USB_SPEED_HIGH);
   891		setup_headers(opts, ss_audio_desc, USB_SPEED_SUPER);
   892	}
   893	
   894	static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
   895	{
   896		struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
   897	
   898		if (!opts->p_chmask && !opts->c_chmask) {
   899			dev_err(dev, "Error: no playback and capture channels\n");
   900			return -EINVAL;
   901		} else if (opts->p_chmask & ~UAC2_CHANNEL_MASK) {
   902			dev_err(dev, "Error: unsupported playback channels mask\n");
   903			return -EINVAL;
   904		} else if (opts->c_chmask & ~UAC2_CHANNEL_MASK) {
   905			dev_err(dev, "Error: unsupported capture channels mask\n");
   906			return -EINVAL;
   907		} else if ((opts->p_ssize < 1) || (opts->p_ssize > 4)) {
   908			dev_err(dev, "Error: incorrect playback sample size\n");
   909			return -EINVAL;
   910		} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
   911			dev_err(dev, "Error: incorrect capture sample size\n");
   912			return -EINVAL;
   913		} else if (!opts->p_srate) {
   914			dev_err(dev, "Error: incorrect playback sampling rate\n");
   915			return -EINVAL;
   916		} else if (!opts->c_srate) {
   917			dev_err(dev, "Error: incorrect capture sampling rate\n");
   918			return -EINVAL;
   919		}
   920	
   921		if (opts->p_volume_max <= opts->p_volume_min) {
   922			dev_err(dev, "Error: incorrect playback volume max/min\n");
 > 923				return -EINVAL;
   924		} else if (opts->c_volume_max <= opts->c_volume_min) {
   925			dev_err(dev, "Error: incorrect capture volume max/min\n");
   926				return -EINVAL;
   927		} else if (opts->p_volume_res <= 0) {
   928			dev_err(dev, "Error: negative/zero playback volume resolution\n");
   929				return -EINVAL;
   930		} else if (opts->c_volume_res <= 0) {
   931			dev_err(dev, "Error: negative/zero capture volume resolution\n");
   932				return -EINVAL;
   933		}
   934	
   935		if ((opts->p_volume_max - opts->p_volume_min) % opts->p_volume_res) {
   936			dev_err(dev, "Error: incorrect playback volume resolution\n");
   937				return -EINVAL;
   938		} else if ((opts->c_volume_max - opts->c_volume_min) % opts->c_volume_res) {
   939			dev_err(dev, "Error: incorrect capture volume resolution\n");
   940				return -EINVAL;
   941		}
   942	
   943		return 0;
   944	}
   945	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
