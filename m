Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CA374195
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772698963; cv=none; b=vBeVSRiBuP8sGsLt4i9DFRPdQOsllIcOL9/qOx3072JC5nYzVc7pu6pbUSIWLVHmJ5DGUNoSXnvdV7Qm6F/1HK92xnQ3tMkcOG2HGQQHOUtUdydj6e+SHbTVqAdAm6G7I8zd4+ajHRCx6dGg8UivhdXVloiRC/H6dtshwf/MeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772698963; c=relaxed/simple;
	bh=zxEHiLL2ZeBOhs2toBwFkwp7yxyaMTzdM/POTda/1Ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GruRoMRj3McDWRPNvaGHUGX/EeWir/n2ZP0CWkNUm+k1pmnB/O5UoXA7/FrW4ysGcNy0tuow7JkKfG53KBMdj9NGQGEc7KCSWF7XjIh0fFOlypoyXTBhcek7KMQcWouDq3KPp1cVn/Ed5p0Hwvsy5qiVCz2lgpgmOsZZhV0KugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0ar8Dub; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0ar8Dub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772698958; x=1804234958;
  h=date:from:to:cc:subject:message-id;
  bh=zxEHiLL2ZeBOhs2toBwFkwp7yxyaMTzdM/POTda/1Ww=;
  b=h0ar8Dub4h7hSl4sbhcjg4rowFwnITWBJubtwoHlUFtI6RLdUamMlOab
   hVTf1I0Fmc3EZdheliRhVh9EPrCUSYksmwKMYDMK59y2Fh9XA37G6g1mx
   LO/GfCLv5tkFCgG0sWu9MgHnU9EmYr32M85IPNkFY7I9Sq7v3Qn5/W8Ml
   U4lW4fNwUSaKG7MfU+z98d4z9m2aETrZrB+emVQsQ1LTOSsM9ZYpwkfaP
   0yc4/GOZ/qDTDdUh3qTUxf9G9p2rAc9oB+8pIUiN31yXXJBiAIwdrQ+lw
   q9KGME7YCP31Ob1ZK4wpOthhgzVwHBVGvcmNvS3miVLX21AXdWNaTBJTT
   A==;
X-CSE-ConnectionGUID: BvlYKEsjRwKMgHXaTWonnQ==
X-CSE-MsgGUID: rYRlbOSkTomX+coo8PzEYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84111405"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84111405"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:22:37 -0800
X-CSE-ConnectionGUID: 2xg1ZJNWTkKbWiMo2NZ/bA==
X-CSE-MsgGUID: umN+cOSCTsqa/4gqNBNU/w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 00:22:34 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy3ya-000000000HW-1pUc;
	Thu, 05 Mar 2026 08:22:32 +0000
Date: Thu, 05 Mar 2026 16:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 410/410]
 include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant
 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is
 always false
Message-ID: <202603051644.t636PniT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   91d48252ad4b17577cf8cc8d3e1353402e4da8f1
commit: 303cd6173dce0a28d26526c77814eb90a41bd898 [410/410] NFSD: prevent integer overflow on 32 bit systems
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051644.t636PniT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051644.t636PniT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051644.t636PniT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from net/sunrpc/clnt.c:36:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
>> include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     734 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from net/sunrpc/xprt.c:49:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
>> include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     734 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/xprt.c:84:6: warning: default initialization of an object of type 'typeof (req->rq_majortimeo)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
      84 |         if (time_before(timeout, req->rq_majortimeo))
         |             ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from net/sunrpc/xprtsock.c:36:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
>> include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     734 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   In file included from net/sunrpc/xprtsock.c:48:
   In file included from include/net/udp.h:26:
   include/net/ip.h:447:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     447 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   3 warnings generated.
--
   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from net/sunrpc/svcsock.c:41:
   include/net/ip.h:447:14: warning: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     447 |                 if (mtu && time_before(jiffies, rt->dst.expires))
         |                            ^
   include/linux/jiffies.h:108:26: note: expanded from macro 'time_before'
     108 | #define time_before(a,b)        time_after(b,a)
         |                                 ^
   include/linux/jiffies.h:105:3: note: expanded from macro 'time_after'
     105 |         (typecheck(unsigned long, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from net/sunrpc/svcsock.c:51:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
>> include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     734 |         if (len > SIZE_MAX / sizeof(*p))
         |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +734 include/linux/sunrpc/xdr.h

   712	
   713	/**
   714	 * xdr_stream_decode_uint32_array - Decode variable length array of integers
   715	 * @xdr: pointer to xdr_stream
   716	 * @array: location to store the integer array or NULL
   717	 * @array_size: number of elements to store
   718	 *
   719	 * Return values:
   720	 *   On success, returns number of elements stored in @array
   721	 *   %-EBADMSG on XDR buffer overflow
   722	 *   %-EMSGSIZE if the size of the array exceeds @array_size
   723	 */
   724	static inline ssize_t
   725	xdr_stream_decode_uint32_array(struct xdr_stream *xdr,
   726			__u32 *array, size_t array_size)
   727	{
   728		__be32 *p;
   729		__u32 len;
   730		ssize_t retval;
   731	
   732		if (unlikely(xdr_stream_decode_u32(xdr, &len) < 0))
   733			return -EBADMSG;
 > 734		if (len > SIZE_MAX / sizeof(*p))
   735			return -EBADMSG;
   736		p = xdr_inline_decode(xdr, len * sizeof(*p));
   737		if (unlikely(!p))
   738			return -EBADMSG;
   739		if (array == NULL)
   740			return len;
   741		if (len <= array_size) {
   742			if (len < array_size)
   743				memset(array+len, 0, (array_size-len)*sizeof(*array));
   744			array_size = len;
   745			retval = len;
   746		} else
   747			retval = -EMSGSIZE;
   748		for (; array_size > 0; p++, array++, array_size--)
   749			*array = be32_to_cpup(p);
   750		return retval;
   751	}
   752	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
