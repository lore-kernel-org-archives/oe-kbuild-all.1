Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6ECD29B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710520580; cv=none; b=fZGjyf+tWCbz+4iWVzB3RrBljcOhCZA58T8AwGjLKEBadY8O35xnN4bhRzE566uaEM/OAgIFcKBIUWJTKLMbrJ8Ixk9hqnFsSYv5f+sk8qZP6+gmcJ6ghgzm/X1OcK+/NXTRue2koQOdQm27KH+1cXvOXv4LPW581CHr2blkZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710520580; c=relaxed/simple;
	bh=cthnUE39dV1X20mE2TSYjtBbPgYiBZj7IWo8f3WighI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrTyRYvLIBzS0W914hT/rlTbcaDzeG9u8j9/K+HQHf1EjgPktbI7Roq8xnOtTtyIxsszs3OhND7zYUQITfnX1e6AdLToIb1tKUBfBOQAVHEhGArtokDkFhH3UinykMS9m1ualIl4ipXy4Cf+d3N2MFrYWrv8YT7Zhni/KVnJyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZB3KE5Z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZB3KE5Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710520578; x=1742056578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cthnUE39dV1X20mE2TSYjtBbPgYiBZj7IWo8f3WighI=;
  b=eZB3KE5Z1iPASdR2Ot8Ce9f4+8JM/cGsf59CKfmtjzm4Cj3r69H+VgLQ
   zfox0lqcx+JC41FEOx3CIH9iAd9fa/9c/8UVW99I6g6amHkXWz8h9nuPB
   F7h5XlkRcA6n715XQcJsovLMd93f7B0ppvFTFQtqHV+76TmZrEkJgtfrf
   ztiRyXzsQ3bSunIgUUjVqRyH3BICJIdmjzP3I2Bb3RfiG7Cv4uP8PTl4q
   M94t8hiWvhZbkT0YicPiqP9RoQ9uVcvUoFBnySShjxvqLH6LEEHxCB51D
   RnBNu5cQN0VZPM6u8tmX69C/dbOJg2pTJ7zsEwpejuqIQlizFn9FeBx8O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="6002045"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="6002045"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 09:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="12643368"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Mar 2024 09:36:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlAXW-000Eco-0s;
	Fri, 15 Mar 2024 16:36:14 +0000
Date: Sat, 16 Mar 2024 00:36:05 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/21] ld: client.c:undefined reference
 to `netfs_write_subrequest_terminated'
Message-ID: <202403160055.ONfarKLE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   0ae2fe605a739d267125eb3c62534722dca7ad41
commit: 0ae2fe605a739d267125eb3c62534722dca7ad41 [21/21] netfs: Use writeback_iter() and improve the writeback algorithm
config: x86_64-buildonly-randconfig-001-20240315 (https://download.01.org/0day-ci/archive/20240316/202403160055.ONfarKLE-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160055.ONfarKLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160055.ONfarKLE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/9p/client.o: in function `p9_client_write_subreq':
   client.c:(.text+0x5235): undefined reference to `netfs_write_subrequest_terminated'
>> ld: client.c:(.text+0x5290): undefined reference to `netfs_write_subrequest_terminated'
   ld: client.c:(.text+0x52f1): undefined reference to `netfs_write_subrequest_terminated'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
