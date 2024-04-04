Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBF56F510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271198; cv=none; b=FDZh/XlOAX7/2Ws1NSOYbFNiVnw1Jmyi1Ik+EN/gt7b3xlAPKEukXj6hTTcaLq0xiqvfAlG+pybgKbuqHBDVu4858eQiD2afJazFbZvqhheObTzzKeIpq/8UI47jYA1Muu87uEgIFUS33jhaveTH1g/ceFXhyxvFnjQl8UlTGlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271198; c=relaxed/simple;
	bh=apasixA6VKCjoXm3jbuA5PbeVPEBdTuNVNC1oJyr9mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrYh5H4eIqHk91H7qstNzUkzRbXfyBRc4Bsh9whAF8gqPp4/pIqxxxinUn5LyloP/BzUyz5PKdlW1Ol/GN85AZeHmZuQSI3ECUZ+cKYdxU4LCymJI3hXYXcXZSn9M1tUGCJPMxnr5L6CnRAASodR3EC2AFQTdVc3FuGmQcCHwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOtbge1b; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOtbge1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271196; x=1743807196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apasixA6VKCjoXm3jbuA5PbeVPEBdTuNVNC1oJyr9mw=;
  b=AOtbge1bhlIeofBh47Sbxj+yGh5lhbtIixlkFhYKFc0rgpAyokmLVTs3
   kEdhFXkwCPXF8y5dpump9/yeI1arnJtOwib2MXuOIZmRUssgzSSUdAOOy
   dJIT5HAoc9cmXP8tUa4zFhAMuhavNPVNJcmrNXfvdqIYfBh2fRzVOETva
   0tPJLQYs+sjMxfuOp+kUorhdfDUZe9qnlZaT6tsONLs4TOQowbkNOFjo1
   7lFyRgH/383aF2w7aBkWXAhXo2uadP/AkIT4T8z1JIMdXqxmzbT1Jafc+
   53ec+u6/zYH2d2fzhmbqYuzgdLrClrn7v2RjxQcfFaF4JethdYDF7dL7U
   g==;
X-CSE-ConnectionGUID: rHHEtIw7SNqRZUG/6IHBSA==
X-CSE-MsgGUID: MooAnyAQTluGOcR/PWViNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7747161"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7747161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:53:15 -0700
X-CSE-ConnectionGUID: Yrlni4NOTPiXBLg1SHdh8A==
X-CSE-MsgGUID: SpYSZ08TQmuYCCAskE2mKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50191957"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 15:53:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVxH-0001b9-2g;
	Thu, 04 Apr 2024 22:53:11 +0000
Date: Fri, 5 Apr 2024 06:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/28] kernel/locking/lock_events.h:61:51:
 warning: 'struct iov_iter' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202404050621.zkIYjOYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   f43454f1aaa3229f819380d12166825180ccee0e
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/28] kernel: convert to read/write iterators
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240405/202404050621.zkIYjOYA-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050621.zkIYjOYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050621.zkIYjOYA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/locking/rwsem.c:33:
>> kernel/locking/lock_events.h:61:51: warning: 'struct iov_iter' declared inside parameter list will not be visible outside of this definition or declaration
      61 | ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
         |                                                   ^~~~~~~~
>> kernel/locking/lock_events.h:61:31: warning: 'struct kiocb' declared inside parameter list will not be visible outside of this definition or declaration
      61 | ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
         |                               ^~~~~


vim +61 kernel/locking/lock_events.h

    60	
  > 61	ssize_t lockevent_read(struct kiocb *iocb, struct iov_iter *to);
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
