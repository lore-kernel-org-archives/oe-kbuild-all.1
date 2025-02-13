Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5493A23BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739422838; cv=none; b=ey+A9txuqL9ZiH4YtBAGssex4MH7nbyQ7U5uxBi5eAF8BMAhf2pb03oUaTcJ07WBhBlWDnOUPebG3dv7pfwdL8ttZAaRp1Yc+ly4BYF39fo4HvvXop1iNXIcqiZxoQD4QK0Ouo2kaQhBqWYCQmoU/e5qZfAmSrm8ZfvHgzZTupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739422838; c=relaxed/simple;
	bh=/jCL+hoK73aXk1g3/58X7kM0RhLEhAE002Frqq2i65M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqXsqtpCok/Own9am/2tklnk4t6Y8m8Fj8c7lLa+fToUevL4N9ywZ1+NCK63277hc6VB9IOeb4tZ75dbYFmC4MqMANUcu6DBtvkFqvt4TuuRBvcFPNqutQUQ13j6uQIZpP3TRpMY/7n826Y3tkyAoixbvjqk4C5WrNIx6Cqm8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Umx/6bP1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Umx/6bP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739422836; x=1770958836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/jCL+hoK73aXk1g3/58X7kM0RhLEhAE002Frqq2i65M=;
  b=Umx/6bP1VyA7HpQqxm5CQciG0EODuW2FLByN4WiG9+aAa4MpSt0AJ3Wb
   kp4PJtB96zlpAnoiJgCAEaQhiAU5HLF0FEgvrZX/Ss0wJkVOzMXmF+lKk
   /LoAfh+3FN7IbYRnbe38qTEQgqP6F9bwmOpZA8fUGhs/0wwPVAuhIX7KZ
   8avA9G8HB+LsbNut35y46Q0Kb+fxRlKJ36axGX0oxby8d7dyqzxtSeu/C
   KzOIMPbaRN06+1fpUaV3TXzC6Qfj9wCd9HjNRNkhhOlnegY6EfBaQeXfV
   gRWYLxyhZhARUs4wilAm6Q4Qxhja9bSaTfQQ0pOwxRqZj8czVUyLrfOms
   g==;
X-CSE-ConnectionGUID: Ru86YuEITMqA6RE0vXsRUw==
X-CSE-MsgGUID: pQ8x3AceQ3Wvlwa+b20GeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43762794"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="43762794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:00:35 -0800
X-CSE-ConnectionGUID: UEIjSutYTviXRspBIrPSxg==
X-CSE-MsgGUID: 45HYtHDOTluz90LS5wMCog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="112795331"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2025 21:00:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiRKy-0016Xr-0J;
	Thu, 13 Feb 2025 05:00:32 +0000
Date: Thu, 13 Feb 2025 12:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, ceph-devel@vger.kernel.org
Subject: [ceph-client:tls_logger 2/13] include/linux/ceph/ceph_san.h:31:5:
 warning: 'snprintf' argument 9 overlaps destination object 'buf'
Message-ID: <202502131230.k0Xqxdgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git tls_logger
head:   cd1e899feeb6a7da55cbb74b9245c8bbb77f82ba
commit: 04fa82972277cd879d1bcb1efe97bbe1c53cd104 [2/13] cephsan: a full string printout
config: sparc64-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131230.k0Xqxdgk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131230.k0Xqxdgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131230.k0Xqxdgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ceph/ceph_debug.h:9,
                    from net/ceph/mon_client.c:2:
   net/ceph/mon_client.c: In function '__send_subscribe':
>> include/linux/ceph/ceph_san.h:31:5: warning: 'snprintf' argument 9 overlaps destination object 'buf' [-Wrestrict]
      31 |     snprintf(buf, LOG_BUF_SIZE, fmt, ##__VA_ARGS__); \
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_debug.h:24:9: note: in expansion of macro 'CEPH_SAN_LOG'
      24 |         CEPH_SAN_LOG("%.*s %12.12s:%-4d : " fmt,                        \
         |         ^~~~~~~~~~~~
   net/ceph/mon_client.c:367:17: note: in expansion of macro 'dout'
     367 |                 dout("%s %s start %llu flags 0x%x\n", __func__, buf,
         |                 ^~~~


vim +31 include/linux/ceph/ceph_san.h

    27	
    28	char *get_log_cephsan(void);
    29	#define CEPH_SAN_LOG(fmt, ...) do { \
    30	    char *buf = get_log_cephsan(); \
  > 31	    snprintf(buf, LOG_BUF_SIZE, fmt, ##__VA_ARGS__); \
    32	} while (0)
    33	/*
    34	 * Internal definitions for Ceph SAN logs.
    35	 * These definitions are not part of the public API but are required by debugfs.c.
    36	 */
    37	struct ceph_san_log_entry {
    38	    char buf[LOG_BUF_SIZE];
    39	    u64 ts;
    40	};
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
