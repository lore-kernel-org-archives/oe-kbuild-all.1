Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C7F1A0728
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400062; cv=none; b=KW4UYK9wX9p3Cg8WBc7OI1WluFRkfLWSbPWjGRZkzoCtMtc+gvhJrQE8v82sEXwLcm9tkKoN6gEjBLhob0gu/oh4Vba4B42d8/6Yhnp48/aYGkZvzltD+n/V4cWR7uvAiaYPZCG9fuGWHjeEyhrVGBKrqgX5VN1VD4tc/JIgjLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400062; c=relaxed/simple;
	bh=fUHN2qhzR7Ez8IZc5UAruBxX09kpIq7fTaS5772nP5k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FN5tSr0jkqXdNqsavk+onpE1eegBZaUWFIgcd8o6g9KuxLln+l5Dpu/a+E4cFf6jgmKxZspjdtKLQtp04dXbC4KJJNFLWehWILDSGqE9Hst6ZNJlSoU/YVcZlHciooHkZ3PuYdtI9QBsR6gfjw6jp/o8GPx1cpwDcg2yUmqUsuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1pE6vDb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1pE6vDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784400060; x=1815936060;
  h=date:from:to:cc:subject:message-id;
  bh=fUHN2qhzR7Ez8IZc5UAruBxX09kpIq7fTaS5772nP5k=;
  b=W1pE6vDbOvsqXaR/nDd2L9VrcSvX/9nOyR6iDcF/QxCmmIzrccKc6VH0
   5sroM9bqM78p8hY78sCY7HoZ3Qr/B7k/rF814BoJmV2WaqrD+Qc1F4ioc
   xX7KcJwwR1BWQjcMAPiHZrJIwFYgUe8mBiVSTJy35uabyEVymMocLqw6O
   gDHK9azECOE64FNVLa8zIl9z0Qer/IPTr1Mbp6sZhwEZdcJj1/JwjSVYb
   iK2hyi8vdbShhbgDKRn6gWF+zNH9fvWTH4IIyQNGKdAgzjlTx+PD/RAnn
   mj26DCDEiz4qX7JBQlnO+tx41vfIskZ3WY5wn4k8zfaz6YvfOwthnCW/a
   g==;
X-CSE-ConnectionGUID: 6hZT3qqzSLCEGRhUjMTJJA==
X-CSE-MsgGUID: W6gixTlqSaWPIih5dm3F3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="88858759"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="88858759"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 11:40:59 -0700
X-CSE-ConnectionGUID: k6lkOjNyRWC5oGBh8Qddgg==
X-CSE-MsgGUID: By/apnVMTNK4CzRIo9lNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="250711213"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jul 2026 11:40:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl9y3-00000000V2f-3RkC;
	Sat, 18 Jul 2026 18:40:55 +0000
Date: Sun, 19 Jul 2026 02:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 32/33] /tmp/ccHdwTNH.s:19: Error: symbol
 `__export_symbol_tty_kclose' is already defined
Message-ID: <202607190233.jDuf7rUV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   59ff18fb9ed34a7d03e8dc75c448a35fd8949ba1
commit: a81a24b4431ee452c72fc8aa523bf6c3afde386b [32/33] unexport tty_lock CHECKME
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260719/202607190233.jDuf7rUV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190233.jDuf7rUV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190233.jDuf7rUV-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccHdwTNH.s: Assembler messages:
>> /tmp/ccHdwTNH.s:19: Error: symbol `__export_symbol_tty_kclose' is already defined

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
