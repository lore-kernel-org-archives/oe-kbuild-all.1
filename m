Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5789288C3D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 01:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762565277; cv=none; b=dMA3zB0fLTZ9ru1tgfII/zVDhAlmCj5mYBfdOkpVflZ3jY0IFDOluMV7QcGrZtKF5LEE0nu+FcYaHwfLooO1ikTUPWYhmCe69jYhRZvE1Sc6FCH7KWh/esdDTXCnggyH5fgj32Qr2yxXGQl4kTV1gLu6mtTUL/jOvmq6YzobXOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762565277; c=relaxed/simple;
	bh=CNibpYXdxNLCbu2Pcc3XXOyXFPGKSeMpXopzmKrLejk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1HMzN1Xgi02NqVbYeEkDT36zxz5nkhAjQ7FKw/NuiIRMHwZqODq38ryqNBo9v9yztYQyrMPklzd3wlWed/O5BgUOIU6xEM4/fGV4eHmdtHo/O4+Rgt5moy3ou08viDk59Zk6uW7JrYCU6816UJPnQsu6tzX2PjMvySf/wVPSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJHLmcuQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJHLmcuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762565275; x=1794101275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNibpYXdxNLCbu2Pcc3XXOyXFPGKSeMpXopzmKrLejk=;
  b=gJHLmcuQUHjm4c2xI3Y2u2nabYalHWJxKIYJExUszGyMub0S6iHDVXpI
   OQqY62WtuqcAQZTauKBsr3sshzphJoJcns9u2LRXFaEsGnWGs//kkdXNj
   siUrsJwLKq2zcajee9f6CME8bGGhBL//ag0gZZEpJ08wxxZt7pMvHYyOn
   fagFfnbmEKtzS/Pd4j6SPRrJN0OLRMuWjhmIXjz66y7iNgSiDKh5PsrvH
   HkmgKzWLO8fFktSXEiCkypXoHug1Sd1ujnCkjMu7gf1mpks8ZYQCpCJAq
   doRpilm/ffgGUyJ1QjHoXUMvHQxXdmuLuKv/1tSV0lsWbvny+0jTuZ9zQ
   g==;
X-CSE-ConnectionGUID: 5EhQ5q0zSZWiNhW3usYfDQ==
X-CSE-MsgGUID: 3k//O9otTdmQD2xR/PGqWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82343724"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="82343724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 17:27:55 -0800
X-CSE-ConnectionGUID: cncrmGflSDGN+D1BoY08+A==
X-CSE-MsgGUID: QpB2D+lWSuaQ9mxSheo68A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="192555981"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Nov 2025 17:27:51 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHXk5-0000Zz-0x;
	Sat, 08 Nov 2025 01:27:49 +0000
Date: Sat, 8 Nov 2025 09:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ranganath V N <vnranganath.20@gmail.com>, davem@davemloft.net,
	edumazet@google.com, horms@kernel.org, jhs@mojatatu.com,
	jiri@resnulli.us, kuba@kernel.org, pabeni@redhat.com,
	xiyou.wangcong@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vnranganath.20@gmail.com,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	skhan@linuxfoundation.org,
	syzbot+0c85cae3350b7d486aee@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/2] net: sched: act_connmark: initialize struct
 tc_ife to fix kernel leak
Message-ID: <202511080914.Sb6puKZN-lkp@intel.com>
References: <20251106195635.2438-2-vnranganath.20@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106195635.2438-2-vnranganath.20@gmail.com>

Hi Ranganath,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.18-rc4 next-20251107]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ranganath-V-N/net-sched-act_connmark-initialize-struct-tc_ife-to-fix-kernel-leak/20251107-035911
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251106195635.2438-2-vnranganath.20%40gmail.com
patch subject: [PATCH v3 1/2] net: sched: act_connmark: initialize struct tc_ife to fix kernel leak
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20251108/202511080914.Sb6puKZN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080914.Sb6puKZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511080914.Sb6puKZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sched/act_connmark.c: In function 'tcf_connmark_dump':
>> net/sched/act_connmark.c:203:9: error: 'index' undeclared (first use in this function)
     203 |         index   = ci->tcf_index;
         |         ^~~~~
   net/sched/act_connmark.c:203:9: note: each undeclared identifier is reported only once for each function it appears in
>> net/sched/act_connmark.c:204:9: error: 'refcnt' undeclared (first use in this function)
     204 |         refcnt  = refcount_read(&ci->tcf_refcnt) - ref;
         |         ^~~~~~
>> net/sched/act_connmark.c:205:9: error: 'bindcnt' undeclared (first use in this function); did you mean 'bind'?
     205 |         bindcnt = atomic_read(&ci->tcf_bindcnt) - bind;
         |         ^~~~~~~
         |         bind


vim +/index +203 net/sched/act_connmark.c

   191	
   192	static inline int tcf_connmark_dump(struct sk_buff *skb, struct tc_action *a,
   193					    int bind, int ref)
   194	{
   195		const struct tcf_connmark_info *ci = to_connmark(a);
   196		unsigned char *b = skb_tail_pointer(skb);
   197		const struct tcf_connmark_parms *parms;
   198		struct tc_connmark opt;
   199		struct tcf_t t;
   200	
   201		memset(&opt, 0, sizeof(opt));
   202	
 > 203		index   = ci->tcf_index;
 > 204		refcnt  = refcount_read(&ci->tcf_refcnt) - ref;
 > 205		bindcnt = atomic_read(&ci->tcf_bindcnt) - bind;
   206	
   207		rcu_read_lock();
   208		parms = rcu_dereference(ci->parms);
   209	
   210		opt.action = parms->action;
   211		opt.zone = parms->zone;
   212		if (nla_put(skb, TCA_CONNMARK_PARMS, sizeof(opt), &opt))
   213			goto nla_put_failure;
   214	
   215		tcf_tm_dump(&t, &ci->tcf_tm);
   216		if (nla_put_64bit(skb, TCA_CONNMARK_TM, sizeof(t), &t,
   217				  TCA_CONNMARK_PAD))
   218			goto nla_put_failure;
   219		rcu_read_unlock();
   220	
   221		return skb->len;
   222	
   223	nla_put_failure:
   224		rcu_read_unlock();
   225		nlmsg_trim(skb, b);
   226		return -1;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
