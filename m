Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED399645
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742798966; cv=none; b=GCZxQZ7L23MmJ4WCAUNh1Bky6hanevreAfHASCyUvaLk9478UZTOvHPC52S0DHcrK/fIwOPPplST82z6j0t2NJWFnhBd3iPQyxIHbBtdCxztNKjCyLiZlE2uhGFLTw/I35PuVBkPZvWb9VTmHYJC/2gAE91nKlPBCTKoQeMHJdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742798966; c=relaxed/simple;
	bh=MeBCltGop41WBqugBNpPQKxAaBr5naKJJrxh4qA/ICg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6Zja+vdgimIGsQSKY7uYBmOjL00aGXN1ndVm6W6ozLwY4Wd1Mi89gc00IrAxb3/XhZNZ5F3MwBISkVy3wx/tN0EFajIj/MYTS4VB5+QVIyL5cxR5YgxQznFWAJzbQce6eeew/C3h2ukzsOWRJInEHg63/KbvaJatvfUX6dBKco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDYqN4BD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDYqN4BD"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso3026788f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742798962; x=1743403762; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dDZsz4UIUxmPWUxqRvwlmJXMsHW01F5Vt73n6SdVvk=;
        b=ZDYqN4BD0fDexloLYYpP6XDg4AMFItaH3KXq4fdC3AVTA5FdJJN8qFs4VhBFkvFo6i
         bF8mubBxDXvn+n7ZerDBSmNV25huDpWw36D2bcqO/4jJfgU4XEczw+f3nFn27kk+Isc6
         wOfGV+JApoFxv+o6eevz+Ng5HK5RbEvIRw872Hu7/24Ab4qbjM8zt1CwQb5dghMvwljQ
         SJg/akDYvA3+VkNJckD5XJE0sEIp9fnlqhBYCDmM4NcozUT5RUHyc6qZvwxdNQ9UKnOI
         MchIQaxchc6Hy9nDLBo5PHbh5ZdMVegdNTL55Ff4xlPzZ+J3FvGWWLsN7ut4eC7EqBuR
         zeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742798962; x=1743403762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dDZsz4UIUxmPWUxqRvwlmJXMsHW01F5Vt73n6SdVvk=;
        b=YEvlHdasjciROGGUIMt+lOhEvyEQGwPF4faLCmEE6vPx6mawFQYsICmdrVy6hpJDCZ
         690ZsUikjcTwcNAFYnira8BUt99oRx0Rw+6sWgCcqRfZudUDSfb+mbliNxTC55y5OpWD
         DAqQgQw9k4bX54wM4fhiqynN9vpfya6zctdwI2/jPnM3QhohHKQejwyT/3dZ0mpUYbNb
         UWXc/EzwC4ztM35JJPinRFr7kjbvqeHJPHuw10In6cgrxUCIDano8J7HnAEzBLhLWrBx
         7N8qoGUkbvCNXPKUCirtjUjnkzUf8Z9gdQxJi28AucZnu5xjx/fYV8gPbt7QYDMaRlat
         MkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwLqC0LFyMB8g2PJR0b2XOLbPBWT/rc2/qdyu9MVB7PzbAKHj5KugKrZaiVAW7s59ZKRJVxbsH1N/gbuS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw6a6dQhHIwh939ZCE2znPX3QkQUSjtIP9gmYrI5Ub4jdEzW4/
	9z61m1He4u2Qwtv8O+Bg4cRD3DbcZqQbF+2LMfT7eDM4sjfMkEsyen/eRoh8Qxs=
X-Gm-Gg: ASbGnctsLJ2fUOJiSUyQVVDplZd93Nr2L1G4D3Nhvpl9Xl0rueWPxZ6KICHQU2j5uaK
	n/MU19k8Fr9Kj62e3SqhkYqYzpAh5+1gdT8f2LhSu8slBpc5xv5RbYmoghrGQRzv8NrC77IztBX
	x2YPo3bUKCoXLz+8CdKB0QYBOSGnI7gMskc6R6CtrMHlM+pAyJC3LFPwokBlrKfNQoCX5rgQ9h5
	aSuzI98oe348nTs0XA8USKEMryu7lv9gYtOAgzFE0fCfs4fJtTv78zXn2tw8Bq730b1EDJVn9ub
	waiqukB/+wUyrlDlwP9lU2wV4xu3fLyhevVgWmJk/HOkOFSHJhZfI6biRjf7
X-Google-Smtp-Source: AGHT+IH/O+SxW/A6tHLl66luw0B3Q+UY6WxKotJgS9M1+9fv6/xBCkqaJIgLc48RFD0NzvhjcR8KOg==
X-Received: by 2002:a05:6000:1565:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-3997f933816mr9868262f8f.21.1742798962016;
        Sun, 23 Mar 2025 23:49:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f995606sm10128335f8f.13.2025.03.23.23.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:49:21 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:49:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 9040/13068]
 drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn:
 variable dereferenced before check 'desc' (see line 345)
Message-ID: <aa29df80-cb5b-48df-a95b-cd8e55cd301a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 6565439894570a07b00dba0b739729fe6b56fba4 [9040/13068] dmaengine: ptdma: Utilize the AE4DMA engine's multi-queue functionality
config: x86_64-randconfig-161-20250323 (https://download.01.org/0day-ci/archive/20250323/202503231648.IEt8P4U5-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503231648.IEt8P4U5-lkp@intel.com/

smatch warnings:
drivers/dma/amd/ptdma/ptdma-dmaengine.c:358 pt_cmd_callback_work() warn: variable dereferenced before check 'desc' (see line 345)

vim +/desc +358 drivers/dma/amd/ptdma/ptdma-dmaengine.c

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  336  static void pt_cmd_callback_work(void *data, int err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  337  {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  338  	struct dma_async_tx_descriptor *tx_desc;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  339  	struct pt_dma_desc *desc = data;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  340  	struct dma_chan *dma_chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  341  	struct virt_dma_desc *vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  342  	struct pt_dma_chan *chan;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  343  	unsigned long flags;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  344  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @345  	dma_chan = desc->vd.tx.chan;
                                                                                                           ^^^^^^
Most of the function assumes "desc" is a valid non-NULL pointer.

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  346  	chan = to_pt_chan(dma_chan);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  347  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  348  	if (err == -EINPROGRESS)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  349  		return;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  350  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  351  	tx_desc = &desc->vd.tx;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  352  	vd = &desc->vd;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  353  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  354  	if (err)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  355  		desc->status = DMA_ERROR;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  356  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  357  	spin_lock_irqsave(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03 @358  	if (desc) {
                                                                                                    ^^^^
Checked too late.

6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  359  		if (desc->status != DMA_COMPLETE) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  360  			if (desc->status != DMA_ERROR)
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  361  				desc->status = DMA_COMPLETE;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  362  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  363  			dma_cookie_complete(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  364  			dma_descriptor_unmap(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  365  		} else {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  366  			tx_desc = NULL;
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  367  		}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  368  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  369  	spin_unlock_irqrestore(&chan->vc.lock, flags);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  370  
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  371  	if (tx_desc) {
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  372  		dmaengine_desc_get_callback_invoke(tx_desc, NULL);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  373  		dma_run_dependencies(tx_desc);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  374  		list_del(&desc->vd.node);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  375  		vchan_vdesc_fini(vd);
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  376  	}
6565439894570a drivers/dma/amd/ptdma/ptdma-dmaengine.c Basavaraj Natikar 2025-02-03  377  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

