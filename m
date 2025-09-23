Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB8321425
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758633073; cv=none; b=l8L+NlbVGmvUI4vw/McF8Svle2YPHcuYTe9XW3dd6P4frjwrmRJeWpGRAmTBk5FhnZhjbQ6zUsqXmjs3/C56e66COdU5oObd+S7t4fyR7Wb7uQNB+QweDu6Rag0V2YJlnDRNXTz64+2tjXuq/J9Jk6cMtle/e9S0q/Aa86JpuJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758633073; c=relaxed/simple;
	bh=t3SyyElLq7C8J5LLcQFEIerClverb44730YKsoKFQHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCRveua8uGWUryExi6qRtAaRgu+XW7EKvmwcMdKWEDjUk5cHscMwfHhx4OG0kuyRYeobbNeM9SXIghSS9wSfBEDe0yoALfBMsNZK4Stli7PFbl4KbbdcSpQpgWF0mS5U2tMGQdpLkoMwg0SAqVpMsj6e68fNWs2RaFP9uugWVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8rqp3II; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8rqp3II"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758633071; x=1790169071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t3SyyElLq7C8J5LLcQFEIerClverb44730YKsoKFQHY=;
  b=T8rqp3IIIRcT7ctBAIpEKBgV2Ud0eeavu/2YdI6qOaSjlN/0JAbdkFLd
   wwZoR2/f81N7WarzlfpWRxh6ChRW/1zffWt+THq1Jv8A5pFkRZn+SQ5hU
   5ftxMhEBu7jbSeCUceu2gHjTCdv3lTiLwMc1IAfDP7jCe2u/UtSB9yDyB
   hmMXYBTSlmiRXGETC4xBQLenKwAwmtZwFwgekikeNyWVEom2bP7FbY7wx
   RAJs2LGWrXW2yvyst9ErxdK4v9EAH0nv9KH3wWCq6nK6O7/jPLK1se93q
   fp954wtPVADytbzUotED7dQsXUmS1RzxvZC+bMIi6vHMYSU4l1HVIhPx2
   A==;
X-CSE-ConnectionGUID: JoIckkQuTASV+HEqvdcHTw==
X-CSE-MsgGUID: Y7pQN3gMS8uMpxTwqQDXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78352872"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="78352872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 06:11:11 -0700
X-CSE-ConnectionGUID: p+cQke5ASi+NRT702FTZOQ==
X-CSE-MsgGUID: ZH/y212ISmGiZyPhVJplrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="182021616"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2025 06:11:09 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v12nT-000000004C9-1nyp;
	Tue, 23 Sep 2025 13:11:07 +0000
Date: Tue, 23 Sep 2025 15:10:28 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/146] htmldocs:
 Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: ERROR: Unexpected
 indentation. [docutils]
Message-ID: <202509231515.ncOcKxL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c73db7ebb024f59416db0cf136dc2d4b9dbc3695
commit: 7eced9d9f4c9ecc2649051198747ef3a61543449 [0/146] platform/x86: Add Intel Software Defined Silicon driver
reproduce: (https://download.01.org/0day-ci/archive/20250923/202509231515.ncOcKxL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231515.ncOcKxL9-lkp@intel.com/

All errors (new ones prefixed by >>):

   p_volume_present        playback volume control enable
   p_volume_min    playback volume control min value (in 1/256 dB)
   p_volume_max    playback volume control max value (in 1/256 dB)
   p_volume_res    playback volume control resolution (in 1/256 dB)
   =========  ============================ [docutils]
>> Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-driver-intel_sdsi:2: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: ERROR: Unexpected indentation. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/ABI/testing/sysfs-platform-dptf:130: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]


vim +2 Documentation/ABI/testing/sysfs-driver-intel_sdsi

   > 2	Date:		Feb 2022
     3	KernelVersion:	5.18
     4	Contact:	"David E. Box" <david.e.box@linux.intel.com>
     5	Description:
     6			This directory contains interface files for accessing Intel
     7			Software Defined Silicon (SDSi) features on a CPU. X
     8			represents the socket instance (though not the socket ID).
     9			The socket ID is determined by reading the registers file
    10			and decoding it per the specification.
    11	
    12			Some files communicate with SDSi hardware through a mailbox.
    13			Should the operation fail, one of the following error codes
    14			may be returned:
    15	
    16			Error Code	Cause
    17		        ----------	-----
    18		        EIO		General mailbox failure. Log may indicate cause.
    19		        EBUSY		Mailbox is owned by another agent.
    20		        EPERM		SDSI capability is not enabled in hardware.
    21		        EPROTO		Failure in mailbox protocol detected by driver.
    22					See log for details.
    23		        EOVERFLOW	For provision commands, the size of the data
    24					exceeds what may be written.
    25		        ESPIPE		Seeking is not allowed.
    26		        ETIMEDOUT	Failure to complete mailbox transaction in time.
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
