Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E59D392C48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 18:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637345; cv=none; b=XhuMfnqADFcXt+EhPDHdwHmVdenN4xh+R6/l8ztVTuXEAbr0+/AVWDBG7X882Yn957+Hqoe3UNWhHwhXdvYyNiYe/49oA3vOKPcqjZP2oAVrtogsP6qxoKyDKIitNxkbtKm/6P7DNpsxVpmxqekBAwE7EjC0ILeMo5RQgB2Ca0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637345; c=relaxed/simple;
	bh=8LsXGiGBAxk/QQ44Ytfnk5RdTMl+K280H72+JKoXr8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L97MnGjXCEM54LFRh+2Gc2JlZYJlRnGUgrs33jwr8WaO1iozZAzIKfS25940IPN1s1LddG8gBXQxnD10QyzPBv77NCjv4w/19UPY0C6gMOky4R+hz9wplpuLkMfVXnxkdVxhzsBFpjy2cWrpXXt8thR13csnseOawO94w6BBnic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0SWqCjs; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0SWqCjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774637344; x=1806173344;
  h=date:from:to:cc:subject:message-id;
  bh=8LsXGiGBAxk/QQ44Ytfnk5RdTMl+K280H72+JKoXr8Q=;
  b=O0SWqCjsG0hHxa+tbM+7NzYgW1zq3kPDO4ImUbVzg286UPfRcCpMNJcH
   skwozr85twxqAeLDU6Dtmez94SoP5SXVeszWH+3pu+CIocvx/9D1fTggF
   f0KK9vJeWd8GVhEPOvwI3encWy1uSZ4168gfHRFlYc+zzePo7tSV/v/9H
   k8LYh8h99wzhg4DME1TcI25AEw9oL6zJ0ivXTbr9n1wQyZ4CIMtYhTWjB
   NDnQ2OyadFa5JiCjyX1lq3TahRB6rJVzL5SqZEwdrqiA7KWHoIUP88Yoe
   7wlf9W8/RPiKeyoF/beh5maxc406SwA1iGP1AO29/d1BS52lvVZkdM18I
   g==;
X-CSE-ConnectionGUID: 9Wmbp1dxTL6dHOIT3Qbm2g==
X-CSE-MsgGUID: 790mi/xTSHG8awclNw75pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87189788"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="87189788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:49:03 -0700
X-CSE-ConnectionGUID: 3iFks4tVT3q0XZ39PikS/Q==
X-CSE-MsgGUID: 3KAlDEnkSuef56soqyfgAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248673731"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2026 11:49:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6CEt-00000000Abx-3XHd;
	Fri, 27 Mar 2026 18:48:59 +0000
Date: Sat, 28 Mar 2026 02:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/2]
 drivers/usb/host/xhci-mem.c:79:6: sparse: sparse: symbol
 'xhci_free_segments_for_ring' was not declared. Should it be static?
Message-ID: <202603280247.3V8HuHl3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c1bb2a3631361a534ff49b36ec755ba10aff9315
commit: 6496f6cfbbd3bf241c6f16c7621db32088a1f073 [0/2] ANDROID: usb: host: export symbols for xhci hooks usage
config: x86_64-randconfig-123-20260327 (https://download.01.org/0day-ci/archive/20260328/202603280247.3V8HuHl3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280247.3V8HuHl3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280247.3V8HuHl3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/host/xhci-mem.c:79:6: sparse: sparse: symbol 'xhci_free_segments_for_ring' was not declared. Should it be static?
   drivers/usb/host/xhci-mem.c:395:16: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/host/xhci-mem.c:1926:16: sparse: sparse: Using plain integer as NULL pointer

vim +/xhci_free_segments_for_ring +79 drivers/usb/host/xhci-mem.c

    78	
  > 79	void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
    80					struct xhci_segment *first)
    81	{
    82		struct xhci_segment *seg;
    83	
    84		seg = first->next;
    85		while (seg != first) {
    86			struct xhci_segment *next = seg->next;
    87			xhci_segment_free(xhci, seg);
    88			seg = next;
    89		}
    90		xhci_segment_free(xhci, first);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
