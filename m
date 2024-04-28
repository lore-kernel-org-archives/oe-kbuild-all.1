Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AAD10E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714270686; cv=none; b=nogaSwKMPCpdPCWyAZLePxchunmhuDaJnDm6atFNfL+N5Szg6Ws1ekS0tDjpZ5MT2Sr9sJXJfjdDybfT2MsN8vZOX6izQg+g5iyrDiVIIKsEqrouU55PrBb+qLr/ykC70PAzVZpnHxFJ60jeYwXZ3jbbQqBzY+3luYRjlIAujVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714270686; c=relaxed/simple;
	bh=dNGSh7ngPiRlBkszmOK8NIVNlgPrcZNAjuyMSbdK/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixjQePul+by4toDNOsNVZy/STJWWTX/iUDsmbtdDXcibr5HcOmoBK4HABJvIFaIOO/lFk+leLAuZ5R2OWQurHpI63d1XNZJ9ikCrFkqLBjbXcU1iQv7oHO+OYPJ5AhngCLAO2WSGjSoOTRvgFLyEBMnXrJIqr2ycCtgj38EYYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEPieR0H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEPieR0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714270685; x=1745806685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dNGSh7ngPiRlBkszmOK8NIVNlgPrcZNAjuyMSbdK/3w=;
  b=jEPieR0HFfCUpCKyk5G6tKxyvIPMS4zvbmIzFgdrN20+Ehik3cd+0pCi
   eQyQAt/IA0xKNpzSSePRv8LZByZusLt79pDOwVnkE+xkFJ65nTNUvmKA2
   7uCZRoZPfsliRuyETQXkD+1txu11TjZUTQ/OCdiqmP79gaQV5oVsXlp5G
   +hkIg82IoVPObNyIovbXOUjBsP7WB+ioiXgkyN78kvz54W9RHBll7aetJ
   pTMIdbuT1UwfKJgdcF0tIC5tsL++OwSfOLRB4SiE/MAL02G1beuMe6Y/6
   NiGMqbZKplr/MKYmWp60meRDwI5t4S+j+nYRtrz5/KkdULnvFRNIifCm2
   Q==;
X-CSE-ConnectionGUID: pIioeSLkTM+4+BXsYaS2vA==
X-CSE-MsgGUID: KNiT9rRqTh2pDMHW9MUteg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9892422"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9892422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:18:04 -0700
X-CSE-ConnectionGUID: ztnFMwMkRqSVdoAcMdx5/g==
X-CSE-MsgGUID: OWxIUmKETsebaw5txu/a5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30236729"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2024 19:18:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0u76-0005kO-0h;
	Sun, 28 Apr 2024 02:18:00 +0000
Date: Sun, 28 Apr 2024 10:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 3934/11728] crypto/testmgr.c:2741:25:
 warning: result of comparison of constant 65536 with expression of type
 'unsigned short' is always false
Message-ID: <202404281021.dftFVKXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: c0c0af22d22cb5541a871d21a7cc01de14aedff9 [3934/11728] crypto: add support for TLS 1.0 record encryption
config: powerpc64-randconfig-002-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281021.dftFVKXu-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281021.dftFVKXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281021.dftFVKXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> crypto/testmgr.c:2741:25: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2740 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2741 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   crypto/testmgr.c:2740:32: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2740 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
    2741 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:168:25: note: expanded from macro 'WARN_ON'
     168 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   crypto/testmgr.c:2818:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2818 |                 default:
         |                 ^
   crypto/testmgr.c:2818:3: note: insert '__attribute__((fallthrough));' to silence this warning
    2818 |                 default:
         |                 ^
         |                 __attribute__((fallthrough)); 
   crypto/testmgr.c:2818:3: note: insert 'break;' to avoid fall-through
    2818 |                 default:
         |                 ^
         |                 break; 
   7 warnings generated.


vim +2741 crypto/testmgr.c

  2674	
  2675	static int __test_tls(struct crypto_aead *tfm, int enc,
  2676			      struct tls_testvec *template, unsigned int tcount,
  2677			      const bool diff_dst)
  2678	{
  2679		const char *algo = crypto_tfm_alg_driver_name(crypto_aead_tfm(tfm));
  2680		unsigned int i, k, authsize;
  2681		char *q;
  2682		struct aead_request *req;
  2683		struct scatterlist *sg;
  2684		struct scatterlist *sgout;
  2685		const char *e, *d;
  2686		struct crypto_wait wait;
  2687		void *input;
  2688		void *output;
  2689		void *assoc;
  2690		char *iv;
  2691		char *key;
  2692		char *xbuf[XBUFSIZE];
  2693		char *xoutbuf[XBUFSIZE];
  2694		char *axbuf[XBUFSIZE];
  2695		int ret = -ENOMEM;
  2696	
  2697		if (testmgr_alloc_buf(xbuf))
  2698			goto out_noxbuf;
  2699	
  2700		if (diff_dst && testmgr_alloc_buf(xoutbuf))
  2701			goto out_nooutbuf;
  2702	
  2703		if (testmgr_alloc_buf(axbuf))
  2704			goto out_noaxbuf;
  2705	
  2706		iv = kzalloc(MAX_IVLEN, GFP_KERNEL);
  2707		if (!iv)
  2708			goto out_noiv;
  2709	
  2710		key = kzalloc(MAX_KEYLEN, GFP_KERNEL);
  2711		if (!key)
  2712			goto out_nokey;
  2713	
  2714		sg = kmalloc(sizeof(*sg) * 8 * (diff_dst ? 2 : 1), GFP_KERNEL);
  2715		if (!sg)
  2716			goto out_nosg;
  2717	
  2718		sgout = sg + 8;
  2719	
  2720		d = diff_dst ? "-ddst" : "";
  2721		e = enc ? "encryption" : "decryption";
  2722	
  2723		crypto_init_wait(&wait);
  2724	
  2725		req = aead_request_alloc(tfm, GFP_KERNEL);
  2726		if (!req) {
  2727			pr_err("alg: tls%s: Failed to allocate request for %s\n",
  2728			       d, algo);
  2729			goto out;
  2730		}
  2731	
  2732		aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
  2733					  crypto_req_done, &wait);
  2734	
  2735		for (i = 0; i < tcount; i++) {
  2736			input = xbuf[0];
  2737			assoc = axbuf[0];
  2738	
  2739			ret = -EINVAL;
  2740			if (WARN_ON(template[i].ilen > PAGE_SIZE ||
> 2741				    template[i].alen > PAGE_SIZE))
  2742				goto out;
  2743	
  2744			memcpy(assoc, template[i].assoc, template[i].alen);
  2745			memcpy(input, template[i].input, template[i].ilen);
  2746	
  2747			if (template[i].iv)
  2748				memcpy(iv, template[i].iv, MAX_IVLEN);
  2749			else
  2750				memset(iv, 0, MAX_IVLEN);
  2751	
  2752			crypto_aead_clear_flags(tfm, ~0);
  2753	
  2754			if (template[i].klen > MAX_KEYLEN) {
  2755				pr_err("alg: aead%s: setkey failed on test %d for %s: key size %d > %d\n",
  2756				       d, i, algo, template[i].klen, MAX_KEYLEN);
  2757				ret = -EINVAL;
  2758				goto out;
  2759			}
  2760			memcpy(key, template[i].key, template[i].klen);
  2761	
  2762			ret = crypto_aead_setkey(tfm, key, template[i].klen);
  2763			if ((!ret) == template[i].fail) {
  2764				pr_err("alg: tls%s: setkey failed on test %d for %s: flags=%x\n",
  2765				       d, i, algo, crypto_aead_get_flags(tfm));
  2766				goto out;
  2767			} else if (ret)
  2768				continue;
  2769	
  2770			authsize = 20;
  2771			ret = crypto_aead_setauthsize(tfm, authsize);
  2772			if (ret) {
  2773				pr_err("alg: aead%s: Failed to set authsize to %u on test %d for %s\n",
  2774				       d, authsize, i, algo);
  2775				goto out;
  2776			}
  2777	
  2778			k = !!template[i].alen;
  2779			sg_init_table(sg, k + 1);
  2780			sg_set_buf(&sg[0], assoc, template[i].alen);
  2781			sg_set_buf(&sg[k], input, (enc ? template[i].rlen :
  2782						   template[i].ilen));
  2783			output = input;
  2784	
  2785			if (diff_dst) {
  2786				sg_init_table(sgout, k + 1);
  2787				sg_set_buf(&sgout[0], assoc, template[i].alen);
  2788	
  2789				output = xoutbuf[0];
  2790				sg_set_buf(&sgout[k], output,
  2791					   (enc ? template[i].rlen : template[i].ilen));
  2792			}
  2793	
  2794			aead_request_set_crypt(req, sg, (diff_dst) ? sgout : sg,
  2795					       template[i].ilen, iv);
  2796	
  2797			aead_request_set_ad(req, template[i].alen);
  2798	
  2799			ret = crypto_wait_req(enc ? crypto_aead_encrypt(req)
  2800					      : crypto_aead_decrypt(req), &wait);
  2801	
  2802			switch (ret) {
  2803			case 0:
  2804				if (template[i].novrfy) {
  2805					/* verification was supposed to fail */
  2806					pr_err("alg: tls%s: %s failed on test %d for %s: ret was 0, expected -EBADMSG\n",
  2807					       d, e, i, algo);
  2808					/* so really, we got a bad message */
  2809					ret = -EBADMSG;
  2810					goto out;
  2811				}
  2812				break;
  2813			case -EBADMSG:
  2814				/* verification failure was expected */
  2815				if (template[i].novrfy)
  2816					continue;
  2817				/* fall through */
  2818			default:
  2819				pr_err("alg: tls%s: %s failed on test %d for %s: ret=%d\n",
  2820				       d, e, i, algo, -ret);
  2821				goto out;
  2822			}
  2823	
  2824			q = output;
  2825			if (memcmp(q, template[i].result, template[i].rlen)) {
  2826				pr_err("alg: tls%s: Test %d failed on %s for %s\n",
  2827				       d, i, e, algo);
  2828				hexdump(q, template[i].rlen);
  2829				pr_err("should be:\n");
  2830				hexdump(template[i].result, template[i].rlen);
  2831				ret = -EINVAL;
  2832				goto out;
  2833			}
  2834		}
  2835	
  2836	out:
  2837		aead_request_free(req);
  2838	
  2839		kfree(sg);
  2840	out_nosg:
  2841		kfree(key);
  2842	out_nokey:
  2843		kfree(iv);
  2844	out_noiv:
  2845		testmgr_free_buf(axbuf);
  2846	out_noaxbuf:
  2847		if (diff_dst)
  2848			testmgr_free_buf(xoutbuf);
  2849	out_nooutbuf:
  2850		testmgr_free_buf(xbuf);
  2851	out_noxbuf:
  2852		return ret;
  2853	}
  2854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
