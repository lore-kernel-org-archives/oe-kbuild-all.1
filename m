Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8D267F4E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483974; cv=none; b=kOSK1IfdjafbfxpL8RY3i2mEFX1KKHJrhQm1fnhYfNjCS6OTNJqx+wfMLXXWj62u+BzVlAcVY+MkQzFoCZDTpdqQ9etjc0j0haSiUm35FXXLHEU1vhnjVxQ+mPnNgBIUk+yFL4atXgeFOgUolH8MdppbVpZ//XGbfvBGtyOzBdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483974; c=relaxed/simple;
	bh=vEfwlOyTkJkaZcYqvuJBKQNj7wGniHisUZIiUXFVrH0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPz8Ei2BcY+TG3cpysyT736EIfyZBSBDcGQ9xItdoM5wRrYXlHbLfbh2KmE1M24Z+WdYCBLpS44vi5dvh4cE2Xaw+WSS9C4mvhg4C4R5mzg1MgU6QJ6zGJMiS3L0dCPW8o9HT+lJAJjvUniCGbnH+pjHZWi0+OoYQFqnIREx0d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iShZcnnE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iShZcnnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740483972; x=1772019972;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vEfwlOyTkJkaZcYqvuJBKQNj7wGniHisUZIiUXFVrH0=;
  b=iShZcnnEd6orZ4TS8uGeUFjb6BndH7sTxm300dufqNIEYe/Vn4Y7gpkz
   +y5Gqbw9va/pCTq6V3hQiMwPX0t9lsitxwguXoGZlBLrdcVKsxDiVtAP8
   QBjM2GkO5Tj0/TXM0Xv8ypjW69a1RJkAuH1ZTPCEp5ngQozHKslM0+p0Y
   sAO7p3Ejav+yYF18NYK3gMy3LoTHSPzBjqRBgaBP2dlI5Ke+/t6917kSa
   JkDuQ6tpmdwS0YFZB/XiI5fYZHV+jPChJCSHx5ZylUClW8WEUB8lh36jW
   GbQjw8fe0Viu4uC2z6VTOokRPa6+HTC9AAJpxBUnyWDsST/YDP/qrNhix
   w==;
X-CSE-ConnectionGUID: 2YIS50xbS+aKWX1nRcV0pA==
X-CSE-MsgGUID: Dj7ilxntS3e+st7GtOEMGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="28875839"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="28875839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 03:46:11 -0800
X-CSE-ConnectionGUID: KpuuSEdnTnmJ9ZmFyFWl/Q==
X-CSE-MsgGUID: Szs8YBbCSVO/O+GQgHUnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="116352540"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Feb 2025 03:46:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmtNc-000ABn-1G
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 11:45:49 +0000
Date: Tue, 25 Feb 2025 19:45:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/66 1/1] mtu3_debugfs.c:undefined reference to
 `usb_debug_root'
Message-ID: <202502251941.BBKYDQpj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/66
head:   c9b203c66daa53a537a014663bf01aaec2da3b32
commit: ae07809255d3e3419205b673aba6d1dce16a0d65 [1/1] usb: mtu3: add debugfs interface files
config: x86_64-buildonly-randconfig-004-20250224 (https://download.01.org/0day-ci/archive/20250225/202502251941.BBKYDQpj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251941.BBKYDQpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251941.BBKYDQpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/usb/mtu3/mtu3_debugfs.o: in function `ssusb_debugfs_create_root':
>> mtu3_debugfs.c:(.text+0xab0): undefined reference to `usb_debug_root'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
