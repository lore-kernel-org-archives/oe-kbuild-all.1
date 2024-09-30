Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6278C9D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688728; cv=none; b=JHmGPrQz9Bs5WmWkKpdyF7HIUwp3R5ovuXAsx+RR8YlgBg6CxI0alIO7a9wWhva9jVvQftcsU/8zhE1jx090UzbQ3R1Q/QFh3JhwzGOuyGfWng3vej98PJ9yiGUobOIoA9VCrLb+NEGtL5idhOqNQnqOOaKLW/fknRfpn/IHFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688728; c=relaxed/simple;
	bh=NxUYT34mYqYmqDUFCGZ1CpBCPdFtYaXz+g05g9pIAOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjFHoAr5GmLz9PZJXGhndzxW16OjkZAO6zWyCxjS7jZ4U3CXLQJYzLILFhoo5yTwKFGn1+uVe2WohdjMWbr7+TtxVABIarI1ridwXx86RkkavpeApRbnmzwUvrVdwKCTq4PagbqK/23pQyQp4qp5v2jq0aYh+/7nvADhHbElRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvn0n5O7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvn0n5O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727688726; x=1759224726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxUYT34mYqYmqDUFCGZ1CpBCPdFtYaXz+g05g9pIAOQ=;
  b=Qvn0n5O70cJ5M/Qhql80NnXanwOAIpEXfuQoI6qAz6qNmccRZKixhxX3
   v2hWdXnqDYMGPttKBy2pAXz/CD3YRXHz15ceiDe8+OCyTkfRWCAQHEpRe
   sqZ0FtpwicjZkiawTlk7/+SlnBSEi0ArjG94foIYAYK4/Ir+2BoHrZHy7
   rO53UjXehfNIe2YsD9/O11Xl+M25K/8K9UYraHq5cz2Vasu6OqYzr7mXk
   Qfe9suBwZKruCM3DMvFShZUuWgUIne+/XSDpvK/c67Y91S3RtGgDkWBxk
   9TWvrZxc9VUFQp+tjpdXWPA67qtvpEPtyF316aL2XqND518L8LfHOKhd+
   g==;
X-CSE-ConnectionGUID: FhCbDQSsRoSCvUfKObrSnw==
X-CSE-MsgGUID: 1NZyzYhhTyOB6MVe8wUPsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14392532"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="14392532"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 02:32:05 -0700
X-CSE-ConnectionGUID: ZqUx0yRURICy/7JVKZJ6/w==
X-CSE-MsgGUID: bYW1unhhRtOtB6KGJ71CnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73521729"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 02:32:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svCl8-000PHl-0W;
	Mon, 30 Sep 2024 09:32:02 +0000
Date: Mon, 30 Sep 2024 17:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 156/16788]
 ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name
 'snd_pcm_format_t'
Message-ID: <202409301759.c6R10iIV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: b88e99c737817b3a29441a12515a0b568094044f [156/16788] MLK-11398: ASoC: fsl_asrc: Add Memory to Memory support
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409301759.c6R10iIV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301759.c6R10iIV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301759.c6R10iIV-lkp@intel.com/

Note: the freescale-fslc/6.6-2.0.x-imx HEAD ac32ba5fe66266329914d2020570364afe217bec builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mxc_asrc.h:126:9: error: unknown type name 'snd_pcm_format_t'
     126 |         snd_pcm_format_t input_format;
         |         ^~~~~~~~~~~~~~~~
   ./usr/include/linux/mxc_asrc.h:127:9: error: unknown type name 'snd_pcm_format_t'
     127 |         snd_pcm_format_t output_format;
         |         ^~~~~~~~~~~~~~~~
>> ./usr/include/linux/mxc_asrc.h:135:9: error: unknown type name 'uint64_t'
     135 |         uint64_t supported_in_format;
         |         ^~~~~~~~
   ./usr/include/linux/mxc_asrc.h:136:9: error: unknown type name 'uint64_t'
     136 |         uint64_t supported_out_format;
         |         ^~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
