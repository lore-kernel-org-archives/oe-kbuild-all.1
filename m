Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA56D1AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 14:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279586; cv=none; b=Ng6Thm4frUhcVstYix/ydIrYH7ChQ78zRS5otwuzp8sZGZ63sn7EGstnc205JsmOa3OTTAwZ/+vY9wC8DKwVOEzuQ9A1KaP0m3wxs9dEsK2MV1fRf0mKQSsyRpqvgRudJXnGY/PxiiaMmfLTP10AYmi6OZLZJYrZEY7si1PcxrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279586; c=relaxed/simple;
	bh=UCGJMc6ecNsmqzQ3vJuaAW3d/NjqwD/WWQJDuK11F+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tyRTwHAKfrdTwFaeawa/o/SJV7ReVt6yMSk5ScOkq5cgxoije7iJ8SSeWdEtQ9/vcX5Cb6klXq0Lt6EeHF7KhlQCVLJB+4FJ/xr5YfYht7WfTLV2axbIVepT5vX6zH1qbpAsgUcmQsfhX2FyehWE/UE9n5UKW+9I6UZvWIE+Lbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibWoRECP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibWoRECP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713279585; x=1744815585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UCGJMc6ecNsmqzQ3vJuaAW3d/NjqwD/WWQJDuK11F+o=;
  b=ibWoRECPAWu3it5q1RumNNDVd4jncucGtLzkBcQCFz1QQDOnaeTXLazO
   rFVZXjFFQXhHmzC9v4M6MuBfYATCzsFplwxH5bwpuZH42QyG05RBQMZn+
   TmAxUWS84mGfaeJNDx+MwoAaUOny5xl8rrEj33B9gqbMCsscc3jileKdh
   7ye+HBvoQ+tgNs5FPjn98ny0ASALEPFz65y/lPRqFIz6kVab7c8DAckFI
   f+Zcc8UjsHWn/PFuo+vmYsrQUvTIN72ELhA3b3dEeY7ycZDFoOcPOYHod
   EtdF6Cnv1iUfQt9a52MzJ/mCo2RCbI5YlIzLTDjC+xdPZCZBBncBIVnzd
   g==;
X-CSE-ConnectionGUID: Tz4vtMS4SimIgQpFYKbsYQ==
X-CSE-MsgGUID: gy4bMw/MT3++3uBVqcGQvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8585947"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8585947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 07:59:44 -0700
X-CSE-ConnectionGUID: 87OEtemLQ2eyAzyLYUCaBg==
X-CSE-MsgGUID: Mfyrit2UTWqDS5h696sfVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22349748"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 16 Apr 2024 07:59:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwkHd-0005O8-0b;
	Tue, 16 Apr 2024 14:59:41 +0000
Date: Tue, 16 Apr 2024 22:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiaohuihui-bzwx-kj <xiaohuihui@bzwx-kj.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7411/7439]
 drivers/net/ethernet/bzwx/nce/comm/txrx.c:5:10: fatal error: ne6x_trace.h:
 No such file or directory
Message-ID: <202404162213.pf9mWsUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ba2303cacfdaf39c19a78290c541499b23712f54
commit: 08f4280700700faaa2393cbf9a402d4f51d3a8a8 [7411/7439] drivers: add Chengdu BeiZhongWangXin Technology N5/N6 Series Network Card Driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240416/202404162213.pf9mWsUO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162213.pf9mWsUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162213.pf9mWsUO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/bzwx/nce/comm/txrx.c:5:10: fatal error: ne6x_trace.h: No such file or directory
       5 | #include "ne6x_trace.h"
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x/ne6x_main.c:15:
>> drivers/net/ethernet/bzwx/nce/ne6x/ne6x.h:35:10: fatal error: reg.h: No such file or directory
      35 | #include "reg.h"
         |          ^~~~~~~
   compilation terminated.
--
   In file included from drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf_main.c:8:
>> drivers/net/ethernet/bzwx/nce/ne6x_vf/ne6xvf.h:41:10: fatal error: reg.h: No such file or directory
      41 | #include "reg.h"
         |          ^~~~~~~
   compilation terminated.


vim +5 drivers/net/ethernet/bzwx/nce/comm/txrx.c

     3	
     4	#include "txrx.h"
   > 5	#include "ne6x_trace.h"
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
