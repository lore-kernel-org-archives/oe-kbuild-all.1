Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752B1A073F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521038; cv=none; b=msqDOyX6+093BMdm6nYS4vJRUsyuuOpOSQ0DLm7R/lRkBlzy8AHTcmpZK1QPicClDuR8vQs04NTmwz+nV0tTvLq3fubrc7l2cKRw2uC5KTUqjmo2ZHK4rgU3Ppx+ulpDwcsrh1b9Sg2rdlYKJg9MF7/YvDNQ2kvuwsJ3Za6hI5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521038; c=relaxed/simple;
	bh=Bi76y6YpBRxjRJ2NIBrDs4jtU9BeQjlZkSb578NS3E4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czpCUYxfTgUrIx8SH/VieGjTm3CBIdiMtDQmAuc5ohwC6Bk4yDY8vW7YCAsgBd1kYkVkYtQ9JNgYzIur+xyqghl0gcWIW4Weo9DeSEeDbAkTEuIgizZs0nE4l8vbFnfPhLuMNxqVe0gbgdGpHBhB8zogZzciaY1PRxye/NZDCyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9xfsq9u; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9xfsq9u"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-613ab402150so2525499eaf.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521035; x=1753125835; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVAbad0bqrRxFZKZsjO45060tZ0nsAfjW1VyioFz3hQ=;
        b=r9xfsq9uyptn8FnAhROHscGuZ+LNqA9TFRftbcGqAtLD0lPlzmpmZxnZf0J7gmlbV+
         4A1ePJx70zRLPS87XMK8CNey1Tm+JSMnP5yDag1PX/AN2b/yEJTK6qHBOFvUIbfI92Tn
         a3GTtJfdcuk1C+W2GUJN3wvHUH92JS8VbrFPdkSLACejVm2POUvPbG32bTDcZQUeA293
         Z/W8uCSr0wXwv+1qzeXEtLdp9XBY1tlqlDTz7OkUwj9mWQGu7vwnMypZyAKuS0Lg3rgl
         6mAZkOI0RikFolzqxvR5Ia47G8XE5boJZYjnpD6Vuv8YWgaAyJ3T1379xw3ooJcUoFhW
         IBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521035; x=1753125835;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVAbad0bqrRxFZKZsjO45060tZ0nsAfjW1VyioFz3hQ=;
        b=rjZjUSQ+Nb0kRefg2vvVkg0gv81Cf23FHG2QSkTu/9xWXjMocLd/WBIiWPBMv+jfiU
         yiU8oEANR9qo4i34yMS9nj1BGYNHsmIjkN318ew2jUj+yiD4zzcLJUQDTyeMbMAVdPR9
         hCOqNkqtDVfj0gJtMhpZlLavAHCSKQTmhMQxJ8VSCitZ8HP/Dized+eAo9Eqo3dsD+p7
         ieMthMDNAWuSVQ6kO9pSPuvg7jhzGKqhEupcjn+m1pSnU1H+muA5yqhKZN+M+nMG95Ut
         U+wLmZD4c1rQDYZs6529F6ApeZhUJkQpfFx7k3Kn0Jqg2l+idhsRB7MPBUCc7okof4yf
         3s/A==
X-Forwarded-Encrypted: i=1; AJvYcCUH3dBILEdgBDuMZ9SCXi8yzAENWKo0yM31wTxqSOYgp73X01RmVGTyO8bD5Z7OSxeGd+2q+vsUQjdPdkT2@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0UA/KOZWCbJyMbNENJvfxOjudaFz/3RyKqalyVI7/nRplBISD
	bEqBmDietUMRHnCnDS8b0399A1VNfsMRhRlVQ8wqZU9lEGPwe9MAyZ8m6Esslv+JJoo=
X-Gm-Gg: ASbGncuYmAsxjVeA1N0UoEVdTfx3F9WKmWRxDaOgxB8tA8g25r1WHPPd/vOJv4cz9DP
	ssYdJobQhCoq6TZyTtZlQJRwRLEKRqMazBRHV0fpZBzm2fxg/8MUGdbvk7eK07RGKangeDPIwy5
	v3WjEd7/evHV/jnqwNQPDFkNiSsZ2VLyLwnpcOupH0N81QhFUeSP4LbIXnRTjtxWOkiqo35J/j2
	M1M2GQlYUdP05OWwE3hvDa0uv+aJ6NWX1Y3Wf7BN3z2uboErrg3ZD/z25vP32a9qy7IATDQUsNG
	WyWvVmndgSyq/wIKmkQvDUbItm43mrhGJSaRk7ma9j26JD/Q0jbeahvEtv+kjaODb0S+yebpqWW
	9mO3dFoOf+paFYxO7EHhD8Fb6MqvsSw==
X-Google-Smtp-Source: AGHT+IGMatdwAQ/bJnDCAryBnd8ohHFGnE9tgHnrBwOBxnhsIjf1MB7IYVqg9olruTThYbySZOCU0g==
X-Received: by 2002:a05:6870:ce41:b0:2ef:2af4:dfcb with SMTP id 586e51a60fabf-2ff271545ddmr10167556fac.28.1752521035426;
        Mon, 14 Jul 2025 12:23:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11235201sm2061442fac.12.2025.07.14.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:23:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 6/6] kernel/fork.c:2318
 copy_dmabuf_info() warn: sleeping in atomic context
Message-ID: <28caf853-4120-4c52-a98d-6a1454a8edbc@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   a9597c7b32ec09bdaf13909f77b203e77b4fbb69
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
config: i386-randconfig-141-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100414.f3Yyuj82-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507100414.f3Yyuj82-lkp@intel.com/

smatch warnings:
kernel/fork.c:2318 copy_dmabuf_info() warn: sleeping in atomic context

vim +2318 kernel/fork.c

f44d593749dcbd T.J. Mercier               2025-06-25  2292  static int copy_dmabuf_info(u64 clone_flags, struct task_struct *p)
f44d593749dcbd T.J. Mercier               2025-06-25  2293  {
f44d593749dcbd T.J. Mercier               2025-06-25  2294  	struct task_dma_buf_record *rec, *copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2295  
f44d593749dcbd T.J. Mercier               2025-06-25  2296  	if (current->dmabuf_info && (clone_flags & (CLONE_VM | CLONE_FILES))
f44d593749dcbd T.J. Mercier               2025-06-25  2297  						== (CLONE_VM | CLONE_FILES)) {
f44d593749dcbd T.J. Mercier               2025-06-25  2298  		/*
f44d593749dcbd T.J. Mercier               2025-06-25  2299  		 * Both MM and FD references to dmabufs are shared with the parent, so
f44d593749dcbd T.J. Mercier               2025-06-25  2300  		 * we can share a RSS counter with the parent.
f44d593749dcbd T.J. Mercier               2025-06-25  2301  		 */
f44d593749dcbd T.J. Mercier               2025-06-25  2302  		refcount_inc(&current->dmabuf_info->refcnt);
f44d593749dcbd T.J. Mercier               2025-06-25  2303  		p->dmabuf_info = current->dmabuf_info;
f44d593749dcbd T.J. Mercier               2025-06-25  2304  		return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2305  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2306  
f44d593749dcbd T.J. Mercier               2025-06-25  2307  	p->dmabuf_info = kmalloc(sizeof(*p->dmabuf_info), GFP_KERNEL);
f44d593749dcbd T.J. Mercier               2025-06-25  2308  	if (!p->dmabuf_info)
f44d593749dcbd T.J. Mercier               2025-06-25  2309  		return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2310  
f44d593749dcbd T.J. Mercier               2025-06-25  2311  	refcount_set(&p->dmabuf_info->refcnt, 1);
f44d593749dcbd T.J. Mercier               2025-06-25  2312  	spin_lock_init(&p->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2313  	INIT_LIST_HEAD(&p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2314  	if (current->dmabuf_info) {
f44d593749dcbd T.J. Mercier               2025-06-25  2315  		spin_lock(&current->dmabuf_info->lock);
                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We're holding a spin lock.

f44d593749dcbd T.J. Mercier               2025-06-25  2316  		p->dmabuf_info->rss = current->dmabuf_info->rss;
f44d593749dcbd T.J. Mercier               2025-06-25  2317  		list_for_each_entry(rec, &current->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25 @2318  			copy = kmalloc(sizeof(*copy), GFP_KERNEL);
                                                                                                              ^^^^^^^^^^
So we aren't allowed to sleep.

f44d593749dcbd T.J. Mercier               2025-06-25  2319  			if (!copy) {
f44d593749dcbd T.J. Mercier               2025-06-25  2320  				spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2321  				goto err_list_copy;
f44d593749dcbd T.J. Mercier               2025-06-25  2322  			}
f44d593749dcbd T.J. Mercier               2025-06-25  2323  
f44d593749dcbd T.J. Mercier               2025-06-25  2324  			copy->dmabuf = rec->dmabuf;
f44d593749dcbd T.J. Mercier               2025-06-25  2325  			copy->refcnt = rec->refcnt;
f44d593749dcbd T.J. Mercier               2025-06-25  2326  			list_add(&copy->node, &p->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier               2025-06-25  2327  		}
f44d593749dcbd T.J. Mercier               2025-06-25  2328  		spin_unlock(&current->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier               2025-06-25  2329  	} else {
f44d593749dcbd T.J. Mercier               2025-06-25  2330  		p->dmabuf_info->rss = 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2331  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2332  
f44d593749dcbd T.J. Mercier               2025-06-25  2333  	return 0;
f44d593749dcbd T.J. Mercier               2025-06-25  2334  
f44d593749dcbd T.J. Mercier               2025-06-25  2335  err_list_copy:
f44d593749dcbd T.J. Mercier               2025-06-25  2336  	list_for_each_entry_safe(rec, copy, &p->dmabuf_info->dmabufs, node) {
f44d593749dcbd T.J. Mercier               2025-06-25  2337  		list_del(&rec->node);
f44d593749dcbd T.J. Mercier               2025-06-25  2338  		kfree(rec);
f44d593749dcbd T.J. Mercier               2025-06-25  2339  	}
f44d593749dcbd T.J. Mercier               2025-06-25  2340  	kfree(p->dmabuf_info);
f44d593749dcbd T.J. Mercier               2025-06-25  2341  	return -ENOMEM;
f44d593749dcbd T.J. Mercier               2025-06-25  2342  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

