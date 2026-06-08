Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA251335BA7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jun 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914676; cv=none; b=cRV8lF7awx+8SWsBtArv0hR+WeYPCMUhZT4azKNmetuFuxCo6xdz7EXvXnnfN9ULM3+wtTuJ/3LgzJtnrVuDQeQqLl/IplbYI2ULRe0ajISQZFzcOf9EPYW4yOAxOzkSy6Ok6bN8gvKiL0+7qRTe2zykLBDXZBPQWm3mAOov8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914676; c=relaxed/simple;
	bh=eDGWLRXhUfVkAdnsCRuCCwRW7JuJok0dW/jQMGYltQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hi+FVYv3j95ni9zGten5SOYnAMzPDnoG52ePJ+mm0hDWQO7iayNq/S7qi2dOplz4hRAeTbWQR7bm8DrRlhhXzwZH1F3ARp6repF1wYMGJa8tiMH+GX3iQANbuVgSCgoMs4YssZXMKKIXRol0Uhrw40iRMKx67/DnXm+Hwxgm45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bONdhcck; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bONdhcck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780914674; x=1812450674;
  h=date:from:to:cc:subject:message-id;
  bh=eDGWLRXhUfVkAdnsCRuCCwRW7JuJok0dW/jQMGYltQo=;
  b=bONdhcckLpLs7CgBAEWY7KypsIojS35AdtANW1Y1tksH8fu2teb1zObJ
   WhwPu5cnKTwF85YQ327gvqaPpIoneL8HaAm2clDKWr7eOmiokoZ19HJ4U
   IHjnaJmD9vwfOcmIxRFFHmvbI54guCUh/YTY0Ex3vhctLNh8TSozr2TPO
   0BUdWzumBGrnrh9n6bIHOg2kG3BWelhtWQKaOJa8wbqPmlt4SehINbLO1
   tnTtxwgEQ/+AQ5Thez2sQkOltWTe6deheANRMFmdFCEY4w4prgMXenzoZ
   FXMKj7o9rXsXQL7FR8aLD7Z0xXKVlvSbJ5NLCngmEFQg91JoIY/zStWkF
   w==;
X-CSE-ConnectionGUID: koP7R5vyQ0CwQ4EHSGxTvA==
X-CSE-MsgGUID: GgYBOz05SyikxSJ11/1Bgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81709816"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81709816"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 03:31:13 -0700
X-CSE-ConnectionGUID: TcYYgMXCSf2URSnIpQXn1w==
X-CSE-MsgGUID: mIA1qdp4TaytvnpUS3pbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="249442446"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Jun 2026 03:31:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWXG8-00000000IfW-3ovb;
	Mon, 08 Jun 2026 10:31:08 +0000
Date: Mon, 08 Jun 2026 18:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11621/11755]
 net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
Message-ID: <202606081815.sBTwdsoH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
commit: cd9cd7b310bd116ec4f07033df356cd7e37f417f [11621/11755] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
config: s390-randconfig-002-20260606 (https://download.01.org/0day-ci/archive/20260608/202606081815.sBTwdsoH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260608/202606081815.sBTwdsoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606081815.sBTwdsoH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/net/tcp.h: Assembler messages:
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:69: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:74: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
   include/net/tcp.h:79: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
>> net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1161: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'
   net/ipv4/inet_connection_sock.c:1166: Warning: missing closing `"'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +1161 net/ipv4/inet_connection_sock.c

a019d6fe2b9da6 Arnaldo Carvalho de Melo 2005-08-09  1140  
3ce5dd8161ecdf Kuniyuki Iwashima        2025-11-06  1141  static bool reqsk_queue_hash_req(struct request_sock *req)
fa76ce7328b289 Eric Dumazet             2015-03-19  1142  {
ff46e3b4421923 luoxuanqiang             2024-06-21  1143  	bool found_dup_sk = false;
ff46e3b4421923 luoxuanqiang             2024-06-21  1144  
ff46e3b4421923 luoxuanqiang             2024-06-21  1145  	if (!inet_ehash_insert(req_to_sk(req), NULL, &found_dup_sk))
ff46e3b4421923 luoxuanqiang             2024-06-21  1146  		return false;
ff46e3b4421923 luoxuanqiang             2024-06-21  1147  
ff46e3b4421923 luoxuanqiang             2024-06-21  1148  	/* The timer needs to be setup after a successful insertion. */
3ce5dd8161ecdf Kuniyuki Iwashima        2025-11-06  1149  	req->timeout = tcp_timeout_init((struct sock *)req);
59f379f9046a9e Kees Cook                2017-10-16  1150  	timer_setup(&req->rsk_timer, reqsk_timer_handler, TIMER_PINNED);
e10902df24488c Kuniyuki Iwashima        2026-06-01  1151  
e10902df24488c Kuniyuki Iwashima        2026-06-01  1152  	preempt_disable_nested();
e10902df24488c Kuniyuki Iwashima        2026-06-01  1153  
3ce5dd8161ecdf Kuniyuki Iwashima        2025-11-06  1154  	mod_timer(&req->rsk_timer, jiffies + req->timeout);
29c6852602e259 Eric Dumazet             2015-09-19  1155  
fa76ce7328b289 Eric Dumazet             2015-03-19  1156  	/* before letting lookups find us, make sure all req fields
fa76ce7328b289 Eric Dumazet             2015-03-19  1157  	 * are committed to memory and refcnt initialized.
fa76ce7328b289 Eric Dumazet             2015-03-19  1158  	 */
fa76ce7328b289 Eric Dumazet             2015-03-19  1159  	smp_wmb();
41c6d650f6537e Reshetova, Elena         2017-06-30  1160  	refcount_set(&req->rsk_refcnt, 2 + 1);
e10902df24488c Kuniyuki Iwashima        2026-06-01 @1161  
e10902df24488c Kuniyuki Iwashima        2026-06-01  1162  	preempt_enable_nested();
e10902df24488c Kuniyuki Iwashima        2026-06-01  1163  
ff46e3b4421923 luoxuanqiang             2024-06-21  1164  	return true;
079096f103faca Eric Dumazet             2015-10-02  1165  }
fa76ce7328b289 Eric Dumazet             2015-03-19  1166  

:::::: The code at line 1161 was first introduced by commit
:::::: e10902df24488ca722303133acfc82490f7d59ad tcp: Add preempt_{disable,enable}_nested() in reqsk_queue_hash_req().

:::::: TO: Kuniyuki Iwashima <kuniyu@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
