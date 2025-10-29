Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249A3126C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725057; cv=none; b=PK9Ceb4YeEgpNY7GHR267Ed4qsGnobRusKz7i/NtVi6tWxJyDg2quzXl1THqwjG0DVPpCX0weaZh8v5hcK3RIggnB0fYcXpHocENEtvdLYJO7q/d0gPIXcvQGgNwoylle+DaPJISoSJ0vqFceHN70C9mwA93xTDI1hJDHVO20Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725057; c=relaxed/simple;
	bh=uzp1EYWHHmoW4L3kvoI4dvKuDc5BuLLdmJ8t7j9RfJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNc0Xs1lhq9CIcxDeqjfFHGSEphILbZ07h+6NXRuA3EzQqxoCkWPesghskTTE8TzaJsnxIQz4sv/Qn0Nivgf+ParaZemQHtbmcB57F6onejrHK/srgtQs43YVKyo6BJ1ZeQEIz1Qdm6sbpmrc9/U5kZxRxIHgf7Zu4QYheHeizE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F5yb3ANJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F5yb3ANJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso37855665e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761725054; x=1762329854; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeET84ZbR5071Nlo4HqVWkKz0PRLXYvBE0ZTUa7ML/M=;
        b=F5yb3ANJAfdHJXiVziJF1YSHloJJqwEXzzVsX+fw4URZ+gxMXYyx42tgn3hccybH20
         CJgGwkLC1w36Tho+f9Dlhrh0ob0Nv1gornul35XQqaLVVKl2nHzBH9Q7U+Di7j/34ure
         1A/mSAhCxc+jR28XtPnYehXW3axQcs4JFjo1jtYEMMeCNVMJ5vz3ZR6BUMx8xnS77K68
         vByqZqZnZG/n7r32g3cgqTrT6irLKift42FM7hjhooi/Q7df3MAIRC2uYiduDb+c355D
         cBXTZI667ykpTGUdGre4J7MD7xw4JzLUX9x7LcCZkM5rhgoPdiGzn2kUYrXhaRys0ZnD
         5GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725054; x=1762329854;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeET84ZbR5071Nlo4HqVWkKz0PRLXYvBE0ZTUa7ML/M=;
        b=pf33Cc1sv/QqRs42wz6Qk3Mn7awXBt10n/GxVqdHXH9HTl8n3zM2LdepdZ6WpnXQoU
         i1R0NwxS26hq9zT+alnct+HiUzf2o0tqNezGuJ4i/b9vagPx+ywLQn0eJMpMVRmHq8re
         vn5D2+ZqXcsl9jdRKSD4+QVYGau2Zv2qN13D9+biEnH08c4MHbryaHSTT18vKL5Rk/Bt
         TAO+ZVGwEl8WQcJEE+7eEJMUGO37Wewm6uDu/SAlA8YKpmmmfDcw8x17RdwVt11CyFzu
         5KxoVLraEyexZxlXCpS7tl4+4yruw8UYAcBHR81N75pUxTqAoOfSDb06EP5PwaWiknvc
         dr5w==
X-Forwarded-Encrypted: i=1; AJvYcCW2I51u5yhPLNQr03XDzCnZDnmJlFrLicRHbNBH5kvfxihORlwfN8RwLifOwNMlhvmxkZ9TR07o12/1PNGs@lists.linux.dev
X-Gm-Message-State: AOJu0YzajOS4ZD3of5q5i8yL0cubVjBvMxAc7hsqcT68haffkjJAvMfj
	Ycy1Qd40p1qgF8NNuOlHK3D0ScO9Qqaz2GstlnOS+z1jEwMrBYb3D/GK9c1WHlDNPLw=
X-Gm-Gg: ASbGncueTYMyLZ+9uUrDmxu2YtgraCis9b76U9P4A/JKTMc9UgLQd6bW5681iaZd9r1
	YqrksZWXApov+XaXGSDdvoeUezwfyTFIn+BA+DFp/NNkc6cRqmfqGRYO07EtuJ81UY+ZP3iTkY6
	XmUQylrJuE4dNor6qGUrChyaQ2V390ywHnyh2kwGV2G+Ay1idiveOCF5INQJN1oXdBfomtaN9Qj
	xfg+S+quqLvOPlJLrQ/q0fmWRfImQlX5cF/rD9OwvozgcqU4VFUpE/XdhUypY8nszE4ItChOPbj
	ei20CKMgeCMvxd+vnaCXhFaTTxwoomigOvI+YSKPdAheofJPYE7nEZf8EuCxARBuh0AymCBLbtW
	EgUMnmE/XrxrkTQc76sPljqykYw9BJPShmVjBAdm4+nR6QVmp04TTQu3pB7VBkvcQ1tbb02O/Ny
	8RxidZ8w==
X-Google-Smtp-Source: AGHT+IH5AxEw0BxzkRq5AIJDF6jo13WbqcDfkxTxeBCSYqlOAQ7PFbsYNFTX+ktgIYzi15idoTu1VA==
X-Received: by 2002:a05:600c:548f:b0:471:747:2116 with SMTP id 5b1f17b1804b1-4771e20e4fcmr16054485e9.41.1761725053516;
        Wed, 29 Oct 2025 01:04:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4771e372a2asm35023665e9.1.2025.10.29.01.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:04:13 -0700 (PDT)
Date: Wed, 29 Oct 2025 11:04:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:ls.rqspin.v2.2 3/3]
 kernel/bpf/bpf_local_storage.c:823 bpf_local_storage_destroy() error: we
 previously assumed 'smap' could be null (see line 797)
Message-ID: <202510291106.zV0JWnRE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git ls.rqspin.v2.2
head:   b735af227349c9ef167cae8acf8bc8864e13f636
commit: b735af227349c9ef167cae8acf8bc8864e13f636 [3/3] [DONT PUSH]
config: i386-randconfig-r072-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291106.zV0JWnRE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510291106.zV0JWnRE-lkp@intel.com/

smatch warnings:
kernel/bpf/bpf_local_storage.c:823 bpf_local_storage_destroy() error: we previously assumed 'smap' could be null (see line 797)

vim +/smap +823 kernel/bpf/bpf_local_storage.c

b735af227349c9 Martin KaFai Lau 2025-10-22  767  u32 bpf_local_storage_destroy(struct bpf_local_storage *local_storage)
c83597fa5dc6b3 Yonghong Song    2022-10-25  768  {
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  769  	struct bpf_local_storage_map *storage_smap;
c83597fa5dc6b3 Yonghong Song    2022-10-25  770  	struct bpf_local_storage_elem *selem;
b735af227349c9 Martin KaFai Lau 2025-10-22  771  	unsigned long b_flags, l_flags;
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  772  	HLIST_HEAD(free_selem_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  773  	HLIST_HEAD(free_only_list);
c83597fa5dc6b3 Yonghong Song    2022-10-25  774  	struct hlist_node *n;
b735af227349c9 Martin KaFai Lau 2025-10-22  775  	u32 uncharge = 0;
c83597fa5dc6b3 Yonghong Song    2022-10-25  776  
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  777  	storage_smap = rcu_dereference_check(local_storage->smap, bpf_rcu_lock_held());
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  778  
c83597fa5dc6b3 Yonghong Song    2022-10-25  779  	/* Neither the bpf_prog nor the bpf_map's syscall
c83597fa5dc6b3 Yonghong Song    2022-10-25  780  	 * could be modifying the local_storage->list now.
c83597fa5dc6b3 Yonghong Song    2022-10-25  781  	 * Thus, no elem can be added to or deleted from the
c83597fa5dc6b3 Yonghong Song    2022-10-25  782  	 * local_storage->list by the bpf_prog or by the bpf_map's syscall.
c83597fa5dc6b3 Yonghong Song    2022-10-25  783  	 *
c83597fa5dc6b3 Yonghong Song    2022-10-25  784  	 * It is racing with bpf_local_storage_map_free() alone
c83597fa5dc6b3 Yonghong Song    2022-10-25  785  	 * when unlinking elem from the local_storage->list and
c83597fa5dc6b3 Yonghong Song    2022-10-25  786  	 * the map's bucket->list.
c83597fa5dc6b3 Yonghong Song    2022-10-25  787  	 */
b735af227349c9 Martin KaFai Lau 2025-10-22  788  
b735af227349c9 Martin KaFai Lau 2025-10-22  789  	/* local_storage->lock must succeed. No bpf prog uses this lock now.k */
b735af227349c9 Martin KaFai Lau 2025-10-22  790  	raw_res_spin_lock_irqsave(&local_storage->lock, l_flags);
c83597fa5dc6b3 Yonghong Song    2022-10-25  791  	hlist_for_each_entry_safe(selem, n, &local_storage->list, snode) {
b735af227349c9 Martin KaFai Lau 2025-10-22  792  		struct bpf_local_storage_map_bucket *b;
b735af227349c9 Martin KaFai Lau 2025-10-22  793  		struct bpf_local_storage_map *smap;
b735af227349c9 Martin KaFai Lau 2025-10-22  794  		long unlink_state;
b735af227349c9 Martin KaFai Lau 2025-10-22  795  
b735af227349c9 Martin KaFai Lau 2025-10-22  796  		smap = rcu_dereference(SDATA(selem)->smap);
b735af227349c9 Martin KaFai Lau 2025-10-22 @797  		b = smap ? select_bucket(smap, local_storage) : NULL;
                                                                    ^^^^
Check for NULL

b735af227349c9 Martin KaFai Lau 2025-10-22  798  		if (b && !raw_res_spin_lock_irqsave(&b->lock, b_flags)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  799  			if (selem_linked_to_map(selem)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  800  				bpf_selem_unlink_map_nolock(selem);
b735af227349c9 Martin KaFai Lau 2025-10-22  801  				bpf_selem_unlink_storage_nolock(local_storage, selem, true, &free_selem_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  802  				raw_res_spin_unlock_irqrestore(&b->lock, b_flags);
b735af227349c9 Martin KaFai Lau 2025-10-22  803  				continue;
c83597fa5dc6b3 Yonghong Song    2022-10-25  804  			}
b735af227349c9 Martin KaFai Lau 2025-10-22  805  			raw_res_spin_unlock_irqrestore(&b->lock, b_flags);
b735af227349c9 Martin KaFai Lau 2025-10-22  806  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  807  
b735af227349c9 Martin KaFai Lau 2025-10-22  808  		/* Failed to unlink selem->map_node. */
b735af227349c9 Martin KaFai Lau 2025-10-22  809  		hlist_del_init_rcu(&selem->snode);
b735af227349c9 Martin KaFai Lau 2025-10-22  810  		RCU_INIT_POINTER(selem->local_storage, NULL);
b735af227349c9 Martin KaFai Lau 2025-10-22  811  		uncharge += selem->uncharge;
b735af227349c9 Martin KaFai Lau 2025-10-22  812  		if (hlist_empty(&local_storage->list)) {
b735af227349c9 Martin KaFai Lau 2025-10-22  813  			local_storage->owner = NULL; /* TODO: not needed? */
b735af227349c9 Martin KaFai Lau 2025-10-22  814  			RCU_INIT_POINTER(*local_storage->owner_storage_ptr, NULL);
b735af227349c9 Martin KaFai Lau 2025-10-22  815  			uncharge += sizeof(*local_storage);
b735af227349c9 Martin KaFai Lau 2025-10-22  816  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  817  
b735af227349c9 Martin KaFai Lau 2025-10-22  818  		unlink_state = cmpxchg(&selem->unlink_state, BPF_LS_UNLINK_NONE,
b735af227349c9 Martin KaFai Lau 2025-10-22  819  				       BPF_LS_UNLINK_STORAGE);
b735af227349c9 Martin KaFai Lau 2025-10-22  820  		switch (unlink_state) {
b735af227349c9 Martin KaFai Lau 2025-10-22  821  		case BPF_LS_UNLINK_NONE:
b735af227349c9 Martin KaFai Lau 2025-10-22  822  			/* selem is protected by rcu now */
b735af227349c9 Martin KaFai Lau 2025-10-22 @823  			bpf_obj_free_fields(smap->map.record, SDATA(selem)->data);
                                                                                            ^^^^^^^^^^^^^^^^
Unchecked dereference.

b735af227349c9 Martin KaFai Lau 2025-10-22  824  			break;
b735af227349c9 Martin KaFai Lau 2025-10-22  825  		case BPF_LS_UNLINK_MAP:
b735af227349c9 Martin KaFai Lau 2025-10-22  826  			/* we own the selem, free it. */
b735af227349c9 Martin KaFai Lau 2025-10-22  827  			hlist_add_head(&selem->free_node, &free_only_list);
b735af227349c9 Martin KaFai Lau 2025-10-22  828  			break;
b735af227349c9 Martin KaFai Lau 2025-10-22  829  		default:
b735af227349c9 Martin KaFai Lau 2025-10-22  830  			WARN_ON_ONCE(1);
b735af227349c9 Martin KaFai Lau 2025-10-22  831  		}
b735af227349c9 Martin KaFai Lau 2025-10-22  832  	}
b735af227349c9 Martin KaFai Lau 2025-10-22  833  	raw_res_spin_unlock_irqrestore(&local_storage->lock, l_flags);
c83597fa5dc6b3 Yonghong Song    2022-10-25  834  
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  835  	bpf_selem_free_list(&free_selem_list, true);
5bd5bab76669b1 Martin KaFai Lau 2024-10-23  836  
b735af227349c9 Martin KaFai Lau 2025-10-22  837  	hlist_for_each_entry_safe(selem, n, &free_only_list, free_node) {
b735af227349c9 Martin KaFai Lau 2025-10-22  838  		/*
b735af227349c9 Martin KaFai Lau 2025-10-22  839  		 * Need to go through a rcu gp:
b735af227349c9 Martin KaFai Lau 2025-10-22  840  		 *
b735af227349c9 Martin KaFai Lau 2025-10-22  841  		 * 1) The tcp_sock is in SLAB_TYPESAFE_BY_RCU, so need
b735af227349c9 Martin KaFai Lau 2025-10-22  842  		 *    to free after a rcu gp.
b735af227349c9 Martin KaFai Lau 2025-10-22  843  		 *
b735af227349c9 Martin KaFai Lau 2025-10-22  844  		 * 2) There is still rcu reader in map_free.
b735af227349c9 Martin KaFai Lau 2025-10-22  845  		 */
b735af227349c9 Martin KaFai Lau 2025-10-22  846  		if (local_storage->bpf_ma)
b735af227349c9 Martin KaFai Lau 2025-10-22  847  			call_rcu(&selem->rcu, bpf_selem_free_ma_rcu);
b735af227349c9 Martin KaFai Lau 2025-10-22  848  		else
b735af227349c9 Martin KaFai Lau 2025-10-22  849  			kfree_rcu(selem, rcu);
b735af227349c9 Martin KaFai Lau 2025-10-22  850  	}
b735af227349c9 Martin KaFai Lau 2025-10-22  851  
b735af227349c9 Martin KaFai Lau 2025-10-22  852  	/* TODO: think about local_storage get reused immediately in bpf_mem_alloc */
b735af227349c9 Martin KaFai Lau 2025-10-22  853  	bpf_local_storage_free(local_storage, storage_smap, true);
b735af227349c9 Martin KaFai Lau 2025-10-22  854  
b735af227349c9 Martin KaFai Lau 2025-10-22  855  	return uncharge;
c83597fa5dc6b3 Yonghong Song    2022-10-25  856  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

