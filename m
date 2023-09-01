Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F46510E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 01:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693530496; x=1725066496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fowc/LUVDlNf9Wae9/6NABL/mdKNBXVS1t9PDFMnbcA=;
  b=blgS/OejHydAaO+lrmQ0hfSpY2zvnpSfFMh9UckLfuUiBVpIOIpZN5+2
   x6w6O7n3Tit8q4TqcL0ZugFCyJ+Zxl2H7Mzac3QdVrg/kbHRB7zc2A9Ch
   1aPMryF1tqGe2QlasxVsTiXaulDwZU5F0gBTIJg8C2Reb87P/6x3Ly5Ki
   mYw6IzTBNbBk+ruMCWsmAK2TNFbOoABaqCEEfvwKRJKJ9/oh9V9vAaXmv
   /sVXtzAvOOXCZTcj7Ki36TtDb8/dq4TmzpuOZYBEsqlfJFWPX+CNYSO3p
   jsirZHWUgxOGCwfZcOZvrTf5T/Iv5DJpkPBNJGxRJPiZ14ybzeT125MMV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361131319"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="361131319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 18:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774811747"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="774811747"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2023 18:08:14 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbsdw-0000iJ-1X;
	Fri, 01 Sep 2023 01:08:12 +0000
Date: Fri, 1 Sep 2023 09:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 4365/24603] crypto/testmgr.c:2619:25:
 warning: result of comparison of constant 65536 with expression of type
 'unsigned short' is always false
Message-ID: <202309010856.8zcNwqUA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Radu,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 922c229d9f78c3c7779f6a14ee86421996a97a45 [4365/24603] crypto: add support for TLS 1.0 record encryption
config: hexagon-randconfig-002-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010856.8zcNwqUA-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010856.8zcNwqUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010856.8zcNwqUA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/testmgr.c:2619:25: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2619 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2620 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
     121 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   crypto/testmgr.c:2618:32: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2618 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
    2619 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
     121 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   2 warnings generated.


vim +2619 crypto/testmgr.c

  2552	
  2553	static int __test_tls(struct crypto_aead *tfm, int enc,
  2554			      struct tls_testvec *template, unsigned int tcount,
  2555			      const bool diff_dst)
  2556	{
  2557		const char *algo = crypto_tfm_alg_driver_name(crypto_aead_tfm(tfm));
  2558		unsigned int i, k, authsize;
  2559		char *q;
  2560		struct aead_request *req;
  2561		struct scatterlist *sg;
  2562		struct scatterlist *sgout;
  2563		const char *e, *d;
  2564		struct crypto_wait wait;
  2565		void *input;
  2566		void *output;
  2567		void *assoc;
  2568		char *iv;
  2569		char *key;
  2570		char *xbuf[XBUFSIZE];
  2571		char *xoutbuf[XBUFSIZE];
  2572		char *axbuf[XBUFSIZE];
  2573		int ret = -ENOMEM;
  2574	
  2575		if (testmgr_alloc_buf(xbuf))
  2576			goto out_noxbuf;
  2577	
  2578		if (diff_dst && testmgr_alloc_buf(xoutbuf))
  2579			goto out_nooutbuf;
  2580	
  2581		if (testmgr_alloc_buf(axbuf))
  2582			goto out_noaxbuf;
  2583	
  2584		iv = kzalloc(MAX_IVLEN, GFP_KERNEL);
  2585		if (!iv)
  2586			goto out_noiv;
  2587	
  2588		key = kzalloc(MAX_KEYLEN, GFP_KERNEL);
  2589		if (!key)
  2590			goto out_nokey;
  2591	
  2592		sg = kmalloc(sizeof(*sg) * 8 * (diff_dst ? 2 : 1), GFP_KERNEL);
  2593		if (!sg)
  2594			goto out_nosg;
  2595	
  2596		sgout = sg + 8;
  2597	
  2598		d = diff_dst ? "-ddst" : "";
  2599		e = enc ? "encryption" : "decryption";
  2600	
  2601		crypto_init_wait(&wait);
  2602	
  2603		req = aead_request_alloc(tfm, GFP_KERNEL);
  2604		if (!req) {
  2605			pr_err("alg: tls%s: Failed to allocate request for %s\n",
  2606			       d, algo);
  2607			goto out;
  2608		}
  2609	
  2610		aead_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
  2611					  crypto_req_done, &wait);
  2612	
  2613		for (i = 0; i < tcount; i++) {
  2614			input = xbuf[0];
  2615			assoc = axbuf[0];
  2616	
  2617			ret = -EINVAL;
  2618			if (WARN_ON(template[i].ilen > PAGE_SIZE ||
> 2619				    template[i].alen > PAGE_SIZE))
  2620				goto out;
  2621	
  2622			memcpy(assoc, template[i].assoc, template[i].alen);
  2623			memcpy(input, template[i].input, template[i].ilen);
  2624	
  2625			if (template[i].iv)
  2626				memcpy(iv, template[i].iv, MAX_IVLEN);
  2627			else
  2628				memset(iv, 0, MAX_IVLEN);
  2629	
  2630			crypto_aead_clear_flags(tfm, ~0);
  2631	
  2632			if (template[i].klen > MAX_KEYLEN) {
  2633				pr_err("alg: aead%s: setkey failed on test %d for %s: key size %d > %d\n",
  2634				       d, i, algo, template[i].klen, MAX_KEYLEN);
  2635				ret = -EINVAL;
  2636				goto out;
  2637			}
  2638			memcpy(key, template[i].key, template[i].klen);
  2639	
  2640			ret = crypto_aead_setkey(tfm, key, template[i].klen);
  2641			if ((!ret) == template[i].fail) {
  2642				pr_err("alg: tls%s: setkey failed on test %d for %s: flags=%x\n",
  2643				       d, i, algo, crypto_aead_get_flags(tfm));
  2644				goto out;
  2645			} else if (ret)
  2646				continue;
  2647	
  2648			authsize = 20;
  2649			ret = crypto_aead_setauthsize(tfm, authsize);
  2650			if (ret) {
  2651				pr_err("alg: aead%s: Failed to set authsize to %u on test %d for %s\n",
  2652				       d, authsize, i, algo);
  2653				goto out;
  2654			}
  2655	
  2656			k = !!template[i].alen;
  2657			sg_init_table(sg, k + 1);
  2658			sg_set_buf(&sg[0], assoc, template[i].alen);
  2659			sg_set_buf(&sg[k], input, (enc ? template[i].rlen :
  2660						   template[i].ilen));
  2661			output = input;
  2662	
  2663			if (diff_dst) {
  2664				sg_init_table(sgout, k + 1);
  2665				sg_set_buf(&sgout[0], assoc, template[i].alen);
  2666	
  2667				output = xoutbuf[0];
  2668				sg_set_buf(&sgout[k], output,
  2669					   (enc ? template[i].rlen : template[i].ilen));
  2670			}
  2671	
  2672			aead_request_set_crypt(req, sg, (diff_dst) ? sgout : sg,
  2673					       template[i].ilen, iv);
  2674	
  2675			aead_request_set_ad(req, template[i].alen);
  2676	
  2677			ret = crypto_wait_req(enc ? crypto_aead_encrypt(req)
  2678					      : crypto_aead_decrypt(req), &wait);
  2679	
  2680			switch (ret) {
  2681			case 0:
  2682				if (template[i].novrfy) {
  2683					/* verification was supposed to fail */
  2684					pr_err("alg: tls%s: %s failed on test %d for %s: ret was 0, expected -EBADMSG\n",
  2685					       d, e, i, algo);
  2686					/* so really, we got a bad message */
  2687					ret = -EBADMSG;
  2688					goto out;
  2689				}
  2690				break;
  2691			case -EBADMSG:
  2692				/* verification failure was expected */
  2693				if (template[i].novrfy)
  2694					continue;
  2695				/* fall through */
  2696			default:
  2697				pr_err("alg: tls%s: %s failed on test %d for %s: ret=%d\n",
  2698				       d, e, i, algo, -ret);
  2699				goto out;
  2700			}
  2701	
  2702			q = output;
  2703			if (memcmp(q, template[i].result, template[i].rlen)) {
  2704				pr_err("alg: tls%s: Test %d failed on %s for %s\n",
  2705				       d, i, e, algo);
  2706				hexdump(q, template[i].rlen);
  2707				pr_err("should be:\n");
  2708				hexdump(template[i].result, template[i].rlen);
  2709				ret = -EINVAL;
  2710				goto out;
  2711			}
  2712		}
  2713	
  2714	out:
  2715		aead_request_free(req);
  2716	
  2717		kfree(sg);
  2718	out_nosg:
  2719		kfree(key);
  2720	out_nokey:
  2721		kfree(iv);
  2722	out_noiv:
  2723		testmgr_free_buf(axbuf);
  2724	out_noaxbuf:
  2725		if (diff_dst)
  2726			testmgr_free_buf(xoutbuf);
  2727	out_nooutbuf:
  2728		testmgr_free_buf(xbuf);
  2729	out_noxbuf:
  2730		return ret;
  2731	}
  2732	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
