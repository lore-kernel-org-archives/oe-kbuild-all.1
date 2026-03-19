Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4803195EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942066; cv=none; b=D7R+wCFpN2JlUACEMM/OCZaPlAmED0vnbC7vTBqL+EjZHTDM8GTa5ZaLavQ44cEZpC8VYNlWFUx5/7cIZOq9xXkv3hcY4gTAnVen+wksqbRXvYXb8tMOvTri/C2rqokiX149l+Ix9YbnCdqbkZ2byAQssWTYGpjCUE3cMqPESy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942066; c=relaxed/simple;
	bh=x3fSisVS15Ph0gio9RU2GGSQL0nU+G8EgHlRuiy2JRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hn4P5tI8t+lb/7Lhoz0lNz//7yb0EABZcHE9SeZkhvnjeXRqGZESZFEU0NOVarri0+x4Ga4WWRpL3l0KoMwto54fDOSF1nUIH87afXryq4oS3Q1GWllHOpyIs9BOzGCe3ZG3c/E1JKd2PFp8T0UeOcYL1AlSm1WCn6lqJdpO18k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbBiw8Hh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbBiw8Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773942061; x=1805478061;
  h=date:from:to:cc:subject:message-id;
  bh=x3fSisVS15Ph0gio9RU2GGSQL0nU+G8EgHlRuiy2JRw=;
  b=MbBiw8HhNNNmiRhHj33j4GPMxLVzu/t82r7gFI5qvzs3vpA9T9oAN58S
   g29hc3n80sGTIXcnQNBzOsA4eltcW8FafQmucRReqtwc8jvhrm0N2IDiC
   YkwhN5WtsBCL5ldHAKZ9Rc1i80xtgV80yzJSVUqjM4a2X2IE7IHSoUahk
   lyq9LA1p/QSV+vYfqrrJAoEEsmwuUXr1J40UU8zG6z5P0gAO0XGo3NiZ7
   QJvxjmBwxq8SEchYYlc/ExBcseor9YXAojQLthsU8t6gevWkJ6F6AEhxR
   r1QGD7UVFKYqjR4Lc3BWMraNzm3khfG0fdRtDi9Z+L9VIuBuU/+LFm+1d
   w==;
X-CSE-ConnectionGUID: busK6ePtR1SZAUGze+KU4A==
X-CSE-MsgGUID: hbRkZb3rQ/6P7878DHIZlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74200947"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74200947"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:40:56 -0700
X-CSE-ConnectionGUID: /iBL9CrtS3uaI80VDYMHdw==
X-CSE-MsgGUID: bSgl/6IbRLi6Xd+vAfLVVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227519519"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 10:40:55 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3HMa-000000001RP-216I;
	Thu, 19 Mar 2026 17:40:52 +0000
Date: Fri, 20 Mar 2026 01:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 88/539] security/smack/smackfs.c:957:36:
 warning: passing argument 2 of 'smk_set_cipso' discards 'const' qualifier
 from pointer target type
Message-ID: <202603200126.laGI5T3f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: e1304db7fdf310d4270e4843eb8c7333bdc7f10a [88/539] smack: convert to read/write iterators
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200126.laGI5T3f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200126.laGI5T3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200126.laGI5T3f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/smack/smackfs.c: In function 'smk_set_cipso':
   security/smack/smackfs.c:840:15: error: 'data' redeclared as different kind of symbol
     840 |         char *data = NULL;
         |               ^~~~
   security/smack/smackfs.c:829:55: note: previous definition of 'data' with type 'char *'
     829 | static ssize_t smk_set_cipso(struct file *file, char *data,
         |                                                 ~~~~~~^~~~
   security/smack/smackfs.c:860:32: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
     860 |         data = memdup_user_nul(buf, count);
         |                                ^~~
         |                                btf
   security/smack/smackfs.c:860:32: note: each undeclared identifier is reported only once for each function it appears in
   security/smack/smackfs.c: In function 'smk_write_cipso':
>> security/smack/smackfs.c:957:36: warning: passing argument 2 of 'smk_set_cipso' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     957 |         return smk_set_cipso(file, buf, count, ppos, SMK_FIXED24_FMT);
         |                                    ^~~
   security/smack/smackfs.c:829:55: note: expected 'char *' but argument is of type 'const char *'
     829 | static ssize_t smk_set_cipso(struct file *file, char *data,
         |                                                 ~~~~~~^~~~
   security/smack/smackfs.c: In function 'smk_write_cipso2':
   security/smack/smackfs.c:1032:36: warning: passing argument 2 of 'smk_set_cipso' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1032 |         return smk_set_cipso(file, buf, count, ppos, SMK_LONG_FMT);
         |                                    ^~~
   security/smack/smackfs.c:829:55: note: expected 'char *' but argument is of type 'const char *'
     829 | static ssize_t smk_set_cipso(struct file *file, char *data,
         |                                                 ~~~~~~^~~~
   security/smack/smackfs.c: In function 'smk_write_load_self':
>> security/smack/smackfs.c:2231:43: warning: passing argument 2 of 'smk_write_rules_list' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2231 |         return smk_write_rules_list(file, buf, count, ppos, &tsp->smk_rules,
         |                                           ^~~
   security/smack/smackfs.c:447:62: note: expected 'char *' but argument is of type 'const char *'
     447 | static ssize_t smk_write_rules_list(struct file *file, char *data,
         |                                                        ~~~~~~^~~~
   security/smack/smackfs.c: In function 'smk_write_load2':
   security/smack/smackfs.c:2368:43: warning: passing argument 2 of 'smk_write_rules_list' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2368 |         return smk_write_rules_list(file, buf, count, ppos, NULL, NULL,
         |                                           ^~~
   security/smack/smackfs.c:447:62: note: expected 'char *' but argument is of type 'const char *'
     447 | static ssize_t smk_write_rules_list(struct file *file, char *data,
         |                                                        ~~~~~~^~~~
   security/smack/smackfs.c: In function 'smk_write_load_self2':
   security/smack/smackfs.c:2442:43: warning: passing argument 2 of 'smk_write_rules_list' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2442 |         return smk_write_rules_list(file, buf, count, ppos, &tsp->smk_rules,
         |                                           ^~~
   security/smack/smackfs.c:447:62: note: expected 'char *' but argument is of type 'const char *'
     447 | static ssize_t smk_write_rules_list(struct file *file, char *data,
         |                                                        ~~~~~~^~~~
   security/smack/smackfs.c: In function 'smk_write_change_rule':
   security/smack/smackfs.c:2568:43: warning: passing argument 2 of 'smk_write_rules_list' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2568 |         return smk_write_rules_list(file, buf, count, ppos, NULL, NULL,
         |                                           ^~~
   security/smack/smackfs.c:447:62: note: expected 'char *' but argument is of type 'const char *'
     447 | static ssize_t smk_write_rules_list(struct file *file, char *data,
         |                                                        ~~~~~~^~~~


vim +957 security/smack/smackfs.c

e114e473771c848 Casey Schaufler 2008-02-04  943  
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  944  /**
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  945   * smk_write_cipso - write() for /smack/cipso
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  946   * @file: file pointer, not actually used
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  947   * @buf: where to get the data from
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  948   * @count: bytes sent
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  949   * @ppos: where to start
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  950   *
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  951   * Accepts only one cipso rule per write call.
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  952   * Returns number of bytes written or error code, as appropriate
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  953   */
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  954  static ssize_t smk_write_cipso(struct file *file, const char __user *buf,
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  955  			       size_t count, loff_t *ppos)
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  956  {
f7112e6c9abf1c7 Casey Schaufler 2012-05-06 @957  	return smk_set_cipso(file, buf, count, ppos, SMK_FIXED24_FMT);
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  958  }
e1304db7fdf310d Jens Axboe      2024-04-10  959  FOPS_WRITE_ITER_HELPER(smk_write_cipso);
f7112e6c9abf1c7 Casey Schaufler 2012-05-06  960  

:::::: The code at line 957 was first introduced by commit
:::::: f7112e6c9abf1c70f001dcf097c1d6e218a93f5c Smack: allow for significantly longer Smack labels v4

:::::: TO: Casey Schaufler <casey@schaufler-ca.com>
:::::: CC: Casey Schaufler <cschaufler@vaio-ubuntu.(none)>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
