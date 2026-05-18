Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD771BBBFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 May 2026 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065634; cv=none; b=aznGkre1HXUsdCFHBYp/bJCkX3xTEqP6BwFSlWxQKEtW0whCBdkS/l1QfKA67fM0WoVZ40Znr6ZtmNphUXlDnZXp/AsfUOYfEanmohYF7ONbzAnhGHOZ5HiHcAOA7BIKYiFeXrJ7BVpj4WzbELzyyH6xJdAm9XKAp3xZFaNi6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065634; c=relaxed/simple;
	bh=+jtgwQ3XcHehBI0BM7Hl7jIfkxK6GcvT8Ox98kChfms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ipk5AmOl6HoXYX9QNBqXoIQBd6MyP/2w6J/LbI/dah1CV/jRjIyd8AL8FvpdrX5sH3mzDn+QjcQ3UG8e6BvZNq4idUSOyhEl+is9irNgWpD6zxbfVD1ztBxD5WdzYhF+AAdObMuSHFOZit21IOBb9MbZ3Z0yB7LzCkpTfRcAVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6zKoS8x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6zKoS8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779065632; x=1810601632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jtgwQ3XcHehBI0BM7Hl7jIfkxK6GcvT8Ox98kChfms=;
  b=L6zKoS8xIvyEK+/E8JjB7WUPsv1YqLuSg7O+YNGOJH0g/ToEMiQS2m7T
   VX0Vi5MtXRE4rlZ35eoyWqqKkPA8TqYgliQcq0GFVJ8RuH01LhlMM+EGt
   wLD4Qf5Av0hCnkaWwp6VpjT6RKUPlkvmWjtfXJUk/A8mmF6pJf9V6ygwd
   BUUt+qGjJ4Ern9URFjA7VAsZGcvVEpdPSdostYb5L+hM4tXkf6J4XOaen
   EDvF4eIKdXQJEQb9bbIToJwWaQpl8Kz+2RGVo8IFuAQMXvg5mg5SSbQRE
   P7QnlIsLORljZa3bS52GOZ4hi/5JLhArYtPo5XivR6gBR6xA3n/jU02fp
   A==;
X-CSE-ConnectionGUID: 5xzWIjY7TNG0e1zPqUkLZg==
X-CSE-MsgGUID: 4cY4Mu3aRCKgk8mnIaCijw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90614468"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="90614468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:53:50 -0700
X-CSE-ConnectionGUID: 6Ts4Z/QwT2SK8Lt21qZmhQ==
X-CSE-MsgGUID: Th1zPp6qRkqEFpTWGFDR+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="236643591"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2026 17:53:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOmEs-000000009fr-3BCT;
	Mon, 18 May 2026 00:53:46 +0000
Date: Mon, 18 May 2026 02:52:50 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 23/52]
 ./include/linux/dynamic_debug.h:331:1: error: expected identifier or '('
 before '}' token
Message-ID: <202605180228.MAwfcBF0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   270053dc597e59c9ffc0b5f17c8863076b56c7cf
commit: a3f35a330ec694a21578ef9d439e502c80e3e227 [23/52] dyndbg: change __dynamic_func_call_cls* macros into expressions
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260518/202605180228.MAwfcBF0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180228.MAwfcBF0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180228.MAwfcBF0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/module.h:31,
                    from ./include/crypto/aria.h:22,
                    from arch/x86/kernel/asm-offsets.c:10:
>> ./include/linux/dynamic_debug.h:331:1: error: expected identifier or '(' before '}' token
     331 | })
         | ^
>> ./include/linux/dynamic_debug.h:331:2: error: expected identifier or '(' before ')' token
     331 | })
         |  ^


vim +331 ./include/linux/dynamic_debug.h

   319	
   320	#define dynamic_pr_debug(fmt, ...)					\
   321		no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
   322	#define dynamic_dev_dbg(dev, fmt, ...)					\
   323		dev_no_printk(KERN_DEBUG, dev, fmt, ##__VA_ARGS__)
   324	#define dynamic_hex_dump(prefix_str, prefix_type, rowsize,		\
   325				 groupsize, buf, len, ascii)			\
   326	({									\
   327		if (0)								\
   328			print_hex_dump(KERN_DEBUG, prefix_str, prefix_type,	\
   329				       rowsize, groupsize, buf, len, ascii);	\
   330		0;
 > 331	})
   332	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
