Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D42319F130
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739650; cv=none; b=J1VAqMEyNJHrh2s2cOYPck1lOjuT5EDa6r91PzHwue8ke7+DLjx1yanLW+j18LC5e0cqLAXzIWmwLzHFI1oJcT9sFHdUe8lc+9JJfoJKgjdzjpqzCus8UfDL/SIhvcJgBmhZTO0ZwGmdIAzi0XIJYuwCwUOxkz6KRKuM+jzADKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739650; c=relaxed/simple;
	bh=IXyVQ+AOAmUZHrDJLa70HH6VsYhdaIOnC4xwMRQpdqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syvE4VaBU6Osp+S9+325SxjcoKG/N0OOiRV1O8byGJLBXUAjRs03e3tlVlnoTwwt6MNL1jECOZTI6vnIB7+xE6QeUAFcldQDPeClBsBnRU4Kzkl2QfqBe9i80mCqQgZPPuReXk3Y3J6YsHKxdDmmEZQ4BAahdOIZ2l2bPFi+cgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjbFRCYt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjbFRCYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758739649; x=1790275649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXyVQ+AOAmUZHrDJLa70HH6VsYhdaIOnC4xwMRQpdqA=;
  b=HjbFRCYtV9R6BE0LpmT0okgohyf6IFbdzi8FsH8WvrWiCc85sXrVT6Vx
   FLpXvnaCPq+0c+EZMiNhKW1eJ2tOrF5J5TPU++7f2j0DeoqVNiIS+vD0/
   7SdrZ1ofRq2e+7AmuvEcdEgD499tr/tF3zKWozLV7e1KH1NJeh46t5HXg
   jpatex39V0VKEE6MccjBfREXJUQlciD5O30S2WA7k56Ojuj1aa4SZn2sw
   VdNBZOE+deXCdR7XuWRoS6J2TI2mI0/eDSnC5z2533Cf9XenJdyjDs7d1
   ot4V4xUwNohBvj8UI+S8Y7uwHmqX8lfJuIllzkXSS+9NzcDuTkgnWdtVP
   w==;
X-CSE-ConnectionGUID: aOY4X8RRSv6IE85Xp7+AeA==
X-CSE-MsgGUID: YP0Nq2tSQwytmtGgv4rEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60086090"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60086090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 11:47:28 -0700
X-CSE-ConnectionGUID: BvJOpdmQRVK1P/8Jt5vRDQ==
X-CSE-MsgGUID: WZMBORl+T9KfrIRFPE7h2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177186498"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2025 11:47:26 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1UWR-000000004dN-3I7H;
	Wed, 24 Sep 2025 18:47:23 +0000
Date: Wed, 24 Sep 2025 20:46:41 +0200
From: kernel test robot <lkp@intel.com>
To: Traian Schiau <traianx.schiau@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:5.15/android_u 3/3] htmldocs:
 Documentation/ABI/testing/sysfs-bus-dvctrace:29: WARNING: Line block ends
 without a blank line. [docutils]
Message-ID: <202509242025.qTv5sv3w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_u
head:   038b979913cc03833b6d6cc18d3a50f11d1040b6
commit: 6209920da07b83c50d895565c5798228503496ce [3/3] dvctrace: Topology descriptors support.
reproduce: (https://download.01.org/0day-ci/archive/20250924/202509242025.qTv5sv3w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509242025.qTv5sv3w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   p_volume_min    playback volume control min value (in 1/256 dB)
   p_volume_max    playback volume control max value (in 1/256 dB)
   p_volume_res    playback volume control resolution (in 1/256 dB)
   =========  ============================ [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:29: ERROR: Unexpected indentation. [docutils]
>> Documentation/ABI/testing/sysfs-bus-dvctrace:29: WARNING: Line block ends without a blank line. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:29: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:9: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:9: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:9: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-bus-dvctrace:49: ERROR: Unexpected indentation. [docutils]


vim +29 Documentation/ABI/testing/sysfs-bus-dvctrace

  > 29	Date:		May 2015
    30	KernelVersion:	4.0
    31	Contact:	Traian Schiau <traianx.schiau@intel.com>
    32	Description:	(RW) Hex-dump of the descriptors provided by the
    33			source device.
    34			eg. A debug class output connection descriptor
    35			09 24 02 04 03 00 00 00 00
    36			ll tt ss xx xx xx xx xx ii
    37			 |  |  |                 +- iConnection string id.
    38			 |  |  +- Descriptor sub-type DC_OUTPUT_CONNECTION
    39			 |  +- Descriptor type (USB_DT_CS_INTERFACE)
    40			 +- Descriptor length
    41			Writing:
    42			  - is not allowed while the device is Reserved or In Use.
    43			  - will replace all the descriptors currently present.
    44			  - will remove any strings previously provided.
    45			  - should use the same format.
    46			  - accepts multiple descriptors separated by space or '\n'.
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
