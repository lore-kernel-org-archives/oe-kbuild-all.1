Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFC14A619
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 20:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667398; cv=none; b=ZZ6zd+LFcGIlxV4bWAAL9eOOXtJelXcFyzeaITg7aNH8QfeRndHA5fEr1FvFAe0yDEki4Ons2oSD9ysLGxZVEWMSS8E6segubz2gtl07DgF4P8lQE90stLMZdS4rhQ/UckffEXAYIvWfNXjlnTc70sCIQsMk2dbmHhD3uHtvxUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667398; c=relaxed/simple;
	bh=ttvpJtgim2JRHRjKYVBnW0QbQw0V1UNZHRfrPqTtvB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ifxi0/tolczatHg3aepcRQLnCPcr6NpV1Y2o4kzmq4HPvAPqWtNF9xZ80Po3wo2kbLl0pFn254m5jlGkO27UBlmHfaZuZLPFITGX7M/qnhKyvN2YlzJMqYATT0f7ZRpGBWRKT3baI5gLuVQLlw7ZY56aZ2Hadi9V0BcUoLJe0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+7yF2AJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+7yF2AJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777667396; x=1809203396;
  h=date:from:to:cc:subject:message-id;
  bh=ttvpJtgim2JRHRjKYVBnW0QbQw0V1UNZHRfrPqTtvB4=;
  b=M+7yF2AJiYns1RL2md/uWt4eoWz8S4JNHxpiNag7s2d1Z1U91iuwQZ+I
   j+7smHufrZNPea6JqJGI7/x6t1UOjcD1W9YMDFfu3MYXapeJxJvQFJx3+
   lAK8pwGpH6YieXDDy1HsGpEz40znP+xN6GIsEe7/udjDHJuezvQ7WUtDT
   yM72UJf5rDxuCfTYyBuNvsXDrkdjAVa7Nbi6lfrh0srjXKNfneG78t4Xt
   MIhzBfC+DUffGLY2XTlhUcrB3o121hiNPTA3rkw7gQ9V1HrSz70RmaKhC
   anByrIibjosa0YTZM4+UmsmYvcOS+FyFL3IntYsun68GLuyrcjvVB8rdK
   g==;
X-CSE-ConnectionGUID: eUcFLTlYT0SAb6io2F/1/A==
X-CSE-MsgGUID: rRAogiluShyOtSIwaac8NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78681204"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78681204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 13:29:55 -0700
X-CSE-ConnectionGUID: R4fhbyVgTiqfwbCYo8JrDA==
X-CSE-MsgGUID: inSJHnHlTx+uB1Q/mmdZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="273053958"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 May 2026 13:29:54 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIuUh-000000000qB-14dN;
	Fri, 01 May 2026 20:29:51 +0000
Date: Sat, 02 May 2026 04:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v3 15/17] io_uring/rsrc.c:49:26:
 warning: cast from pointer to integer of different size
Message-ID: <202605020446.wm6oD6gK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v3
head:   2226dcdd68e72043edf2bad602e2ce5723dbe16b
commit: 4c889f62fe7e807f1642baff240520bd999b92d8 [15/17] io_uring/rsrc: introduce buf registration structure
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020446.wm6oD6gK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020446.wm6oD6gK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020446.wm6oD6gK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_iov_to_regbuf_desc':
>> io_uring/rsrc.c:49:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      49 |                 .uaddr = (u64)iov->iov_base,
         |                          ^


vim +49 io_uring/rsrc.c

    44	
    45	static void io_iov_to_regbuf_desc(const struct iovec *iov,
    46					  struct io_uring_regbuf_desc *desc)
    47	{
    48		*desc = (struct io_uring_regbuf_desc) {
  > 49			.uaddr = (u64)iov->iov_base,
    50			.size = iov->iov_len,
    51		};
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
