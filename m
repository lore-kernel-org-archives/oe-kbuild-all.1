Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F471862BD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727527040; cv=none; b=UN1Sf+b1NJpVywuAT16GCvN9lITcPEqBFNpqFbvlUMUTZvcLzkHSjjtKHZKBYmmg8pZ4DNL4Cv7L/DIe692jnwP1YaIYdJn8YpRGGmx2cFliQgM3OBBE+RvNlSvX1fE56qonvNOmL09zcpQsqptU5hJIvTLv4DqAwBJmvxWkzpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727527040; c=relaxed/simple;
	bh=d9c5+9OiA4LDo6T+SamE3RQiYkvcHL2Cj5TcaFosuR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1l0cDV7HtYsam5FqfVJbLcXHUw8JVQNyi394K4GEkIlxVVLoA8YH7bCVUVOVd5gSwRx+6oYDI+opr9JfnzgNJu+7SOrb6h0vE/hMsFG+uH5A/TGtFa/oKGcgE3Y6pUIrLzxsJUjQsxgoGPrj6ZqQx7pp2x8dF6nKO4XR1MiVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtF61ACJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtF61ACJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727527038; x=1759063038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d9c5+9OiA4LDo6T+SamE3RQiYkvcHL2Cj5TcaFosuR0=;
  b=MtF61ACJJckRtNg40x7TM9XpGm3ZDiAoizHSzwYDYJR/02KjKY/Oqfw/
   KejzUV0C3u6ZLQZG9cejSu7nhH6nkzLBs8UPv6ImH2vrEgDm22zP+mFty
   OzO9SEybQJxJLSclnM98jtAb84t9xieWoYTOp9cE4eE1M2F+oAteUrCeb
   FLVEWoSmVH4cJ1M62CjCHhKt7BuVhp65LC1x9rMBfjA8j2osCeG5jZmme
   yEsc2R7SFRjytCJtjAt3mZYJfqTlYdpeC3FqE9Ima5biGpad5tMxyZeuf
   bEMdK6ERNg7svOMu+LhkauGxLh7z+g3H8ETjoHGcD8FCFGeayDIpoVZZL
   A==;
X-CSE-ConnectionGUID: C7QqEQdURuO1Z3V6NLHx4w==
X-CSE-MsgGUID: kyFrZRbDTAqBtX+/fIEJEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26174640"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26174640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 05:37:16 -0700
X-CSE-ConnectionGUID: aOmt9pLmRjK0P7xG+VItUw==
X-CSE-MsgGUID: 8GHByirVSMyJ/NWdW3LORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72678790"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 05:37:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suWhE-000NGH-2F;
	Sat, 28 Sep 2024 12:37:12 +0000
Date: Sat, 28 Sep 2024 20:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3934/16788] crypto/testmgr.c:2741:25:
 warning: result of comparison of constant 65536 with expression of type
 'unsigned short' is always false
Message-ID: <202409282044.U8tDv4zq-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: c0c0af22d22cb5541a871d21a7cc01de14aedff9 [3934/16788] crypto: add support for TLS 1.0 record encryption
config: powerpc64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282044.U8tDv4zq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282044.U8tDv4zq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282044.U8tDv4zq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:43:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      43 | DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      44 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:89:1: note: expanded from here
      89 | __do_insb
         | ^
   arch/powerpc/include/asm/io.h:609:56: note: expanded from macro '__do_insb'
     609 | #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:91:1: note: expanded from here
      91 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
     610 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:93:1: note: expanded from here
      93 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:95:1: note: expanded from here
      95 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:97:1: note: expanded from here
      97 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from crypto/testmgr.c:27:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:99:1: note: expanded from here
      99 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> crypto/testmgr.c:2741:25: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2740 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2741 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   crypto/testmgr.c:2740:32: warning: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Wtautological-constant-out-of-range-compare]
    2740 |                 if (WARN_ON(template[i].ilen > PAGE_SIZE ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
    2741 |                             template[i].alen > PAGE_SIZE))
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/bug.h:88:25: note: expanded from macro 'WARN_ON'
      88 |         int __ret_warn_on = !!(x);                              \
         |                                ^
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
   16 warnings generated.


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
