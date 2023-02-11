Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB87E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676148809; x=1707684809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jGeDp6oxROmchg2IcURfEj5LqyYNIHc0VpNOvnVjbQw=;
  b=TwFA1Ut2Z25e8jkDujcG36kNY/TbU0HAYM8lLx9gGC7Y7L15GoTPZrXr
   miiHLESUX+t3J8ZAT8JPlEQQDULDT7Jd3Eqvxaan3BIdUt+spQyvEYRTI
   u+8X0zpPszU0HnYSxcTSJFQNX70au4OuOL9G30FgZShgAELGA17bvhqkz
   NlkctCyoytj+gbzdKtgg/1emELfk3wjBcb9zpJa+NUkGNUZjE2cM8Zr8x
   4tDwCJv/ydH5LmmdqVLsCokBdvxkP4tHbTHyTi7jpHawlPyNQRod9CrAv
   //tQtvcuRrEQhlVh4ITJr2hqB176JhsBSgFq3LkyokYT8UjHqliakn8sl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="331959930"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="331959930"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 12:53:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="757135143"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="757135143"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Feb 2023 12:53:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQws7-0006n3-2d;
	Sat, 11 Feb 2023 20:53:23 +0000
Date: Sun, 12 Feb 2023 04:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.03a 73/92]
 net/netfilter/ipvs/ip_vs_est.c:552:29: error: macro "kfree_rcu" requires 2
 arguments, but only 1 given
Message-ID: <202302120430.VpTCBA2m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.03a
head:   077af4236f06a251931179a46f69d1815ceb4f97
commit: d904447bec170523e97e847d0dfb0d1033ab36da [73/92] rcu/kvfree: Eliminate k[v]free_rcu() single argument macro
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230212/202302120430.VpTCBA2m-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/d904447bec170523e97e847d0dfb0d1033ab36da
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.03a
        git checkout d904447bec170523e97e847d0dfb0d1033ab36da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/netfilter/ipvs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302120430.VpTCBA2m-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_est.c: In function 'ip_vs_stop_estimator':
>> net/netfilter/ipvs/ip_vs_est.c:552:29: error: macro "kfree_rcu" requires 2 arguments, but only 1 given
     552 |                 kfree_rcu(td);
         |                             ^
   In file included from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/hardirq.h:9,
                    from include/linux/interrupt.h:11,
                    from net/netfilter/ipvs/ip_vs_est.c:21:
   include/linux/rcupdate.h:984: note: macro "kfree_rcu" defined here
     984 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         | 
>> net/netfilter/ipvs/ip_vs_est.c:552:17: error: 'kfree_rcu' undeclared (first use in this function); did you mean 'kfree_skb'?
     552 |                 kfree_rcu(td);
         |                 ^~~~~~~~~
         |                 kfree_skb
   net/netfilter/ipvs/ip_vs_est.c:552:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/kfree_rcu +552 net/netfilter/ipvs/ip_vs_est.c

^1da177e4c3f41 net/ipv4/ipvs/ip_vs_est.c      Linus Torvalds    2005-04-16  518  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  519  /* Unlink estimator from chain */
0f34d54bf48892 net/netfilter/ipvs/ip_vs_est.c Eric W. Biederman 2015-09-21  520  void ip_vs_stop_estimator(struct netns_ipvs *ipvs, struct ip_vs_stats *stats)
^1da177e4c3f41 net/ipv4/ipvs/ip_vs_est.c      Linus Torvalds    2005-04-16  521  {
3a14a313f9b406 net/ipv4/ipvs/ip_vs_est.c      Sven Wegener      2008-08-10  522  	struct ip_vs_estimator *est = &stats->est;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  523  	struct ip_vs_est_tick_data *td;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  524  	struct ip_vs_est_kt_data *kd;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  525  	int ktid = est->ktid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  526  	int row = est->ktrow;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  527  	int cid = est->ktcid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  528  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  529  	/* Failed to add to chain ? */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  530  	if (hlist_unhashed(&est->list))
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  531  		return;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  532  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  533  	/* On return, estimator can be freed, dequeue it now */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  534  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  535  	/* In est_temp_list ? */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  536  	if (ktid < 0) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  537  		hlist_del(&est->list);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  538  		goto end_kt0;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  539  	}
3a14a313f9b406 net/ipv4/ipvs/ip_vs_est.c      Sven Wegener      2008-08-10  540  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  541  	hlist_del_rcu(&est->list);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  542  	kd = ipvs->est_kt_arr[ktid];
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  543  	td = rcu_dereference_protected(kd->ticks[row], 1);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  544  	__clear_bit(cid, td->full);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  545  	td->chain_len[cid]--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  546  	if (!td->chain_len[cid])
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  547  		__clear_bit(cid, td->present);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  548  	kd->tick_len[row]--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  549  	__set_bit(row, kd->avail);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  550  	if (!kd->tick_len[row]) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  551  		RCU_INIT_POINTER(kd->ticks[row], NULL);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22 @552  		kfree_rcu(td);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  553  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  554  	kd->est_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  555  	if (kd->est_count) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  556  		/* This kt slot can become available just now, prefer it */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  557  		if (ktid < ipvs->est_add_ktid)
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  558  			ipvs->est_add_ktid = ktid;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  559  		return;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  560  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  561  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  562  	if (ktid > 0) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  563  		mutex_lock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  564  		ip_vs_est_kthread_destroy(kd);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  565  		ipvs->est_kt_arr[ktid] = NULL;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  566  		if (ktid == ipvs->est_kt_count - 1) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  567  			ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  568  			while (ipvs->est_kt_count > 1 &&
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  569  			       !ipvs->est_kt_arr[ipvs->est_kt_count - 1])
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  570  				ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  571  		}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  572  		mutex_unlock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  573  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  574  		/* This slot is now empty, prefer another available kt slot */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  575  		if (ktid == ipvs->est_add_ktid)
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  576  			ip_vs_est_update_ktid(ipvs);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  577  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  578  
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  579  end_kt0:
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  580  	/* kt 0 is freed after all other kthreads and chains are empty */
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  581  	if (ipvs->est_kt_count == 1 && hlist_empty(&ipvs->est_temp_list)) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  582  		kd = ipvs->est_kt_arr[0];
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  583  		if (!kd || !kd->est_count) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  584  			mutex_lock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  585  			if (kd) {
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  586  				ip_vs_est_kthread_destroy(kd);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  587  				ipvs->est_kt_arr[0] = NULL;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  588  			}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  589  			ipvs->est_kt_count--;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  590  			mutex_unlock(&ipvs->est_mutex);
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  591  			ipvs->est_add_ktid = 0;
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  592  		}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  593  	}
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  594  }
705dd344408127 net/netfilter/ipvs/ip_vs_est.c Julian Anastasov  2022-11-22  595  

:::::: The code at line 552 was first introduced by commit
:::::: 705dd34440812735ece298eb5bc153fde9544d42 ipvs: use kthreads for stats estimation

:::::: TO: Julian Anastasov <ja@ssi.bg>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
