Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB93B9931
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 18:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790879134; cv=none; b=W4gWQftc19zAJ+eDFkmCfAym1/9r4FutsG8164VcMaQW3Zrf7zxl1AGbkbt2e/M/1aRJy2bj1OZSV/n+zfiiOyPJZ1WtKA+xfy/E3XIf0ov0/Ivp4I81cZ5/o6xm1zZk2XMfw0Ywa9Rfit01l8VX4pNoIAkOSuNnEv6i0lRc7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790879134; c=relaxed/simple;
	bh=/Ti5mqYUj8qcUUke8PztnPs+Iu9IKPs7lPlRWUFsRTU=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4fGOuP8mnt5V6Edn8/JHQUwenRJt8ODQsRM/cSLpA6QeDIyehSo1Mea4YkchmGUljksfDYzLp7CFn7lDb7EozYLqkDGzKzxv4qCvL3H1EACBvErqz7sAaykB/f/z7QZm+pc9EsaE4DtU6yhmqQuMVXlCIAcBLwQ7QnerLoPKZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHtv8cny; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHtv8cny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790879132; x=1822415132;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=/Ti5mqYUj8qcUUke8PztnPs+Iu9IKPs7lPlRWUFsRTU=;
  b=bHtv8cnyv9WvoIdkfFx1ljKORm7WmCTm/O60RPSB7e/8jxEAVhM5Ytk8
   Tu0bWg3Towgc/80aiMKRfokAOYklT+X3DEQhZUnOcWXc75nEB0jLHgSXR
   qjxuKSswPeZaEfiwxMx77C0rNwXcGGQnv8u/eVknu2hPdjabAfaBi0039
   w1tt2N3Ov3EZ2E4lzbtgsMN4MulQDfEdP/nB39K/7sK8sDz1+u14PUSPZ
   32YS+tEtFaBxDF3HEuVCVqJRQZorkhtLLNoz0NNaFHTREgGiDmCjSpA/w
   tabAJdgz218REvueZs6MkDH8o4BrIox6JBDBW9LvdOu4WJ7AGfaQtEb4p
   A==;
X-CSE-ConnectionGUID: eKKMKFyASQ6QBs8DU1WVLg==
X-CSE-MsgGUID: YiFTd2KsSQSJsfspw1OePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94134513"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94134513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 11:25:30 -0700
X-CSE-ConnectionGUID: vhIT2gBASnuv2qQxoajsbA==
X-CSE-MsgGUID: F99fNInGQE6Qn1IHR3ve+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274693309"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Oct 2026 11:25:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCLTD-00000000SDP-1LGT
	for oe-kbuild-all@lists.linux.dev;
	Thu, 01 Oct 2026 18:25:27 +0000
Date: Fri, 2 Oct 2026 02:24:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: usb: gadget: f_uac1: fix ac_header_desc in descriptor lists
Message-ID: <202610020257.roSohAyM-lkp@intel.com>
References: <202610020257.roSohAyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610020257.roSohAyM-lkp@intel.com>

Hi Paritosh,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/paritoshpotukuchi-gmail-com/usb-gadget-f_uac1-fix-ac_header_desc-in-descriptor-lists/20261001-075808
base:   
patch link:    https://lore.kernel.org/r/202610020257.roSohAyM-lkp%40intel.com
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261002/202610020257.roSohAyM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020257.roSohAyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020257.roSohAyM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac1.c:263:9: error: initializer element is not constant
     263 |         (struct usb_descriptor_header *)ac_header_desc,
         |         ^
   drivers/usb/gadget/function/f_uac1.c:263:9: note: (near initialization for 'f_audio_desc[1]')
   drivers/usb/gadget/function/f_uac1.c:335:9: error: initializer element is not constant
     335 |         (struct usb_descriptor_header *)ac_header_desc,
         |         ^
   drivers/usb/gadget/function/f_uac1.c:335:9: note: (near initialization for 'f_audio_ss_desc[1]')


vim +263 drivers/usb/gadget/function/f_uac1.c

   260	
   261	static struct usb_descriptor_header *f_audio_desc[] = {
   262		(struct usb_descriptor_header *)&ac_interface_desc,
 > 263		(struct usb_descriptor_header *)ac_header_desc,
   264	
   265		(struct usb_descriptor_header *)&usb_out_it_desc,
   266		(struct usb_descriptor_header *)&io_out_ot_desc,
   267		(struct usb_descriptor_header *)&out_feature_unit_desc,
   268	
   269		(struct usb_descriptor_header *)&io_in_it_desc,
   270		(struct usb_descriptor_header *)&usb_in_ot_desc,
   271		(struct usb_descriptor_header *)&in_feature_unit_desc,
   272	
   273		(struct usb_descriptor_header *)&ac_int_ep_desc,
   274	
   275		(struct usb_descriptor_header *)&as_out_interface_alt_0_desc,
   276		(struct usb_descriptor_header *)&as_out_interface_alt_1_desc,
   277		(struct usb_descriptor_header *)&as_out_header_desc,
   278	
   279		(struct usb_descriptor_header *)&as_out_type_i_desc,
   280	
   281		(struct usb_descriptor_header *)&as_out_ep_desc,
   282		(struct usb_descriptor_header *)&as_iso_out_desc,
   283	
   284		(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
   285		(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
   286		(struct usb_descriptor_header *)&as_in_header_desc,
   287	
   288		(struct usb_descriptor_header *)&as_in_type_i_desc,
   289	
   290		(struct usb_descriptor_header *)&as_in_ep_desc,
   291		(struct usb_descriptor_header *)&as_iso_in_desc,
   292		NULL,
   293	};
   294	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
