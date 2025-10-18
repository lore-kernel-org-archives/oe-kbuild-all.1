Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF011217F31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 02:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760755709; cv=none; b=qRuy2J56QgZvdf9QdQD6XEuPBKkAbEqWwB7C9Rel2m9COnMdbNBzj7Vo1eacgHg4BbLHfKHJr0tdPoyFPAzzOhuHY9MhSjxW5fAQVGT0PtQq1/QDuair2vQLF6MkUF9LzpcscBAifs1jZjvVw1NCMjXuBk9RR360ec0vcCQonGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760755709; c=relaxed/simple;
	bh=QQBHa7pal8At7ITFoh0REpSWZHHp3fA6KZPvVhFo8bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrgN6/gJR1cmKFNpwu0FJVs8EoyNB3L+ywDQfZqy8L/6qkFyxkIYV4cN0avb6WIUHA9DCbHHvtftbksUtOymEzrXLRNexLPukRE5GahTRBq/Y3JSj1vG22y5YbkEKjqAcSmypuJ4N8zTVNG1ay3SP2Nm8H8IG8YvppuVKk+Kc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLAzO8ZV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLAzO8ZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760755708; x=1792291708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QQBHa7pal8At7ITFoh0REpSWZHHp3fA6KZPvVhFo8bg=;
  b=dLAzO8ZV5/oQBVjktSuvfuP0azKv55y8V8EY3dLH7Ry17Xaynm08nwwF
   dZNcTw25elHwQ9ZePGGrmSp3LvoO4bPC9beY2WXg6Up1a0/Rw7vFm4ljV
   9rggF0R+9I0hkKR4FHFY8DaMzNVaBgX+CpJU/cpB8dYSBXtckMf1TkD6a
   qqqoaeCzqP/DFxuslUxQ8fchtbscs9P7Ignt559hcWBL9BhDaBW1eb2z8
   dAGISlqWPiDS30FOo/FaAAgotSF8/sOt03KRqVX2TmRQbc/NKLOA/6MUs
   CFXRSjZV7gD87mCjREQ37bTTna1jtV8L0WI/3+5J3UaW1wSHluWaWVX/3
   w==;
X-CSE-ConnectionGUID: zT1lB1FPQZaIdhSREDpY+g==
X-CSE-MsgGUID: MpAxoJ9rQ1KhuXZRnv7k4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66611758"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66611758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:48:26 -0700
X-CSE-ConnectionGUID: CI3n8+9ARhOdSFNW0x0SvA==
X-CSE-MsgGUID: LGdwScD6S92jsW+ba06P5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="182530787"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 17 Oct 2025 17:34:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9uu4-0007sZ-0Y;
	Sat, 18 Oct 2025 00:34:36 +0000
Date: Sat, 18 Oct 2025 08:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/17] crypto/jitterentropy.h:8:34: warning:
 'struct sha3_256_ctx' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202510180826.OZ7JEeuK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   91d7b63566e977976872603971e4a3ec4efeeb60
commit: 3a417817ad73f1bd4708285f0d3364d6b4a20c40 [6/17] crypto/jitterentropy: Use lib/crypto/sha3
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251018/202510180826.OZ7JEeuK-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180826.OZ7JEeuK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180826.OZ7JEeuK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/jitterentropy-testing.c:12:
>> crypto/jitterentropy.h:8:34: warning: 'struct sha3_256_ctx' declared inside parameter list will not be visible outside of this definition or declaration
       8 | extern int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
         |                                  ^~~~~~~~~~~~
   crypto/jitterentropy.h:11:35: warning: 'struct sha3_256_ctx' declared inside parameter list will not be visible outside of this definition or declaration
      11 | int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len);
         |                                   ^~~~~~~~~~~~
   crypto/jitterentropy.h:15:37: warning: 'struct sha3_256_ctx' declared inside parameter list will not be visible outside of this definition or declaration
      15 |                              struct sha3_256_ctx *hash_state, struct rand_data *p_ec);
         |                                     ^~~~~~~~~~~~
   crypto/jitterentropy.h:21:62: warning: 'struct sha3_256_ctx' declared inside parameter list will not be visible outside of this definition or declaration
      21 |                                                       struct sha3_256_ctx *hash_state);
         |                                                              ^~~~~~~~~~~~


vim +8 crypto/jitterentropy.h

     2	
     3	extern void *jent_kvzalloc(unsigned int len);
     4	extern void jent_kvzfree(void *ptr, unsigned int len);
     5	extern void *jent_zalloc(unsigned int len);
     6	extern void jent_zfree(void *ptr);
     7	extern void jent_get_nstime(__u64 *out);
   > 8	extern int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
     9				  unsigned int addtl_len, __u64 hash_loop_cnt,
    10				  unsigned int stuck);
    11	int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len);
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
