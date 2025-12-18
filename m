Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DCF2EC0AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059683; cv=none; b=DusLE7vtnqRjksFuJv8KbwwG6HWRdsNOc0erK2kMUrGCo5LZx/hLZvfrts0Uln8shTfIOCsosIRv7IG9iAlfsdi6rQLYJ5uoySgTjcyfFAGtauiabXFq4MnXakzmqf4OpUpVHHocC5CLHO2ZqL7D5HD4yn98v96qYvUv0oFHG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059683; c=relaxed/simple;
	bh=MDTXsIx2zce9ANXPqlzP4SJ7+j5jquHJT2TWtQlWoHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rX9BEGWNar3fDm4Fb4OsUtjbducxP+gGkkn1Nx536W+41zgp8tghgHZmx13rwxNKohgk9rdAj63A79nrENyhstmbEXgegnoedqKN5lcDOwBR2aBbeFKWqsu0SwFzYXCKKGXolltYoDbJC2F896CdW9wVAtBUHYfo8u4z+3Pp5F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNgFDZmt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNgFDZmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766059682; x=1797595682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDTXsIx2zce9ANXPqlzP4SJ7+j5jquHJT2TWtQlWoHc=;
  b=cNgFDZmtuQiLFKdWo6aub0WmT0rzvwFCVP7rB+0Q4ytnZisCPeoopcxO
   RV23lFSm3OCuuG4B8E3/wHEVFv6psOBbE0tyZPkIZiDkSCgcV1vIsmUdH
   FJ8JITZWsvU4o5zPtU2QGtb0DAQf7B+OnJYbnw79Nl0Pp4bVUFfmxiRrc
   rNWnSfL+gzNTf0SmYcQi74iLn1eoRFuNIrfQ4Dy9XPyVqEAxv6V794TA1
   8LWABp6jUbAEN93049teJIttgXUy2redGgbF+zIvcpfCmrErHkyhBjID7
   j/sDDIypX/vH8gzSUyyFgOJs/CwSgPpXzj9Fgs9hSgkUhJVbiXCAUQHHO
   Q==;
X-CSE-ConnectionGUID: ZWnF7J7ZR82VDXn4oYlFJg==
X-CSE-MsgGUID: 9uH50gXdQJeKD5XuLdXAKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="93485326"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="93485326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 04:08:01 -0800
X-CSE-ConnectionGUID: yMeHkjYuTeSPmB0PLWIoNg==
X-CSE-MsgGUID: QQFvKFr5QrOyP7jWkeUzig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="199402032"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Dec 2025 04:08:00 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWCnW-0000000022X-0MbB;
	Thu, 18 Dec 2025 12:07:58 +0000
Date: Thu, 18 Dec 2025 20:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:6.6-velinux 87/87] security/integrity/ima/ima_api.c:194:
 warning: Function parameter or member 'file' not described in
 'ima_get_action'
Message-ID: <202512182007.J9K5j6Xo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   8ba291f6d44d3336d9ef45cc81cf3f5a000bf246
commit: 7b6654d9d529df2c6ca1b225d28d44e232032cd5 [87/87] bytedance: ima: add IMA filename condition.
config: x86_64-bytedance-6.6-velinux-kselftests (https://download.01.org/0day-ci/archive/20251218/202512182007.J9K5j6Xo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512182007.J9K5j6Xo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182007.J9K5j6Xo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/integrity/ima/ima_api.c:194: warning: Function parameter or member 'file' not described in 'ima_get_action'
--
>> security/integrity/ima/ima_policy.c:575: warning: Function parameter or member 'file' not described in 'ima_match_rules'
>> security/integrity/ima/ima_policy.c:765: warning: Function parameter or member 'file' not described in 'ima_match_policy'


vim +194 security/integrity/ima/ima_api.c

3323eec921efd8 Mimi Zohar              2009-02-04  162  
3323eec921efd8 Mimi Zohar              2009-02-04  163  /**
d9d300cdb6f233 Dmitry Kasatkin         2012-06-27  164   * ima_get_action - appraise & measure decision based on policy.
39f60c1ccee72c Christian Brauner       2023-01-13  165   * @idmap: idmap of the mount the inode was found from
4834177e633258 Tyler Hicks             2020-07-09  166   * @inode: pointer to the inode associated with the object being validated
d906c10d8a3165 Matthew Garrett         2018-01-08  167   * @cred: pointer to credentials structure to validate
d906c10d8a3165 Matthew Garrett         2018-01-08  168   * @secid: secid of the task being validated
20f482ab9e0f80 Lans Zhang              2017-01-06  169   * @mask: contains the permission mask (MAY_READ, MAY_WRITE, MAY_EXEC,
20f482ab9e0f80 Lans Zhang              2017-01-06  170   *        MAY_APPEND)
4ad87a3d7444de Mimi Zohar              2016-01-14  171   * @func: caller identifier
725de7fabb9fe4 Eric Richter            2016-06-01  172   * @pcr: pointer filled in if matched measure policy sets pcr=
19453ce0bcfbdf Matthew Garrett         2019-06-19  173   * @template_desc: pointer filled in if matched measure policy sets template=
2b4a2474a2027e Tushar Sugandhi         2021-01-07  174   * @func_data: func specific data, may be NULL
1624dc0086056c THOBY Simon             2021-08-16  175   * @allowed_algos: allowlist of hash algorithms for the IMA xattr
3323eec921efd8 Mimi Zohar              2009-02-04  176   *
3323eec921efd8 Mimi Zohar              2009-02-04  177   * The policy is defined in terms of keypairs:
3323eec921efd8 Mimi Zohar              2009-02-04  178   *		subj=, obj=, type=, func=, mask=, fsmagic=
3323eec921efd8 Mimi Zohar              2009-02-04  179   *	subj,obj, and type: are LSM specific.
d906c10d8a3165 Matthew Garrett         2018-01-08  180   *	func: FILE_CHECK | BPRM_CHECK | CREDS_CHECK | MMAP_CHECK | MODULE_CHECK
4958db3245fa65 Roberto Sassu           2023-01-31  181   *	| KEXEC_CMDLINE | KEY_CHECK | CRITICAL_DATA | SETXATTR_CHECK
4958db3245fa65 Roberto Sassu           2023-01-31  182   *	| MMAP_CHECK_REQPROT
3323eec921efd8 Mimi Zohar              2009-02-04  183   *	mask: contains the permission mask
3323eec921efd8 Mimi Zohar              2009-02-04  184   *	fsmagic: hex value
3323eec921efd8 Mimi Zohar              2009-02-04  185   *
2fe5d6def1672a Mimi Zohar              2012-02-13  186   * Returns IMA_MEASURE, IMA_APPRAISE mask.
2fe5d6def1672a Mimi Zohar              2012-02-13  187   *
3323eec921efd8 Mimi Zohar              2009-02-04  188   */
7b6654d9d529df Guixiong Wei            2025-03-05  189  int ima_get_action(struct file *file, struct mnt_idmap *idmap, struct inode *inode,
a2d2329e30e224 Christian Brauner       2021-01-21  190  		   const struct cred *cred, u32 secid, int mask,
a2d2329e30e224 Christian Brauner       2021-01-21  191  		   enum ima_hooks func, int *pcr,
e9085e0ad38a33 Lakshmi Ramasubramanian 2019-12-11  192  		   struct ima_template_desc **template_desc,
1624dc0086056c THOBY Simon             2021-08-16  193  		   const char *func_data, unsigned int *allowed_algos)
3323eec921efd8 Mimi Zohar              2009-02-04 @194  {
da1b0029f527a9 Mimi Zohar              2016-09-29  195  	int flags = IMA_MEASURE | IMA_AUDIT | IMA_APPRAISE | IMA_HASH;
3323eec921efd8 Mimi Zohar              2009-02-04  196  
fd5f4e9054acbf Dmitry Kasatkin         2014-11-05  197  	flags &= ima_policy_flag;
2fe5d6def1672a Mimi Zohar              2012-02-13  198  
7b6654d9d529df Guixiong Wei            2025-03-05  199  	return ima_match_policy(file, idmap, inode, cred, secid, func, mask,
1624dc0086056c THOBY Simon             2021-08-16  200  				flags, pcr, template_desc, func_data,
1624dc0086056c THOBY Simon             2021-08-16  201  				allowed_algos);
2fe5d6def1672a Mimi Zohar              2012-02-13  202  }
2fe5d6def1672a Mimi Zohar              2012-02-13  203  

:::::: The code at line 194 was first introduced by commit
:::::: 3323eec921efd815178a23107ab63588c605c0b2 integrity: IMA as an integrity service provider

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
