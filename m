Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5902D1A76BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818592; cv=none; b=I1yvXplVEyPcr/kixC4YYj6x4UaiRabiB6XiUiZ/XqjYxbYIbyQ7chN15pOY8LH9y0aMI5gThUOsmbqPvkSITcLnAxziWs4IoLrDibA4QPhNL5024XF+IZ8IE7qW7ab9xPLtTvb1Y1TVdVFQcb5JgPIAns+Dx2BnyqIRGQtGkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818592; c=relaxed/simple;
	bh=Ackd6oL4QEZhNsdWFDsaCVzCrTRV/Pf/z7DouQ0Gs5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYz0a3XgsPFXtTzDL6mMrSn8vplruZP++fBwCBzlHZeq/TwIBS8i5Z/w8sBDgF7Ec/pkKvHGoMVJALp2lWVPeTVAUOrSkuZINv9+3/QQVEfaPva7A6jeAX4d78+K5IDG3JN5n19SotTP/b9tV7Pqs1chep6TlrkIsFJ4iN7nIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=koIfgwaV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="koIfgwaV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-749068b9b63so549939b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jun 2025 19:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750818590; x=1751423390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRoBVr301Z32U1U+wNWEV8kI1I28cFbSqrPbaNR/5yE=;
        b=koIfgwaVLiQAxKu8IspyYUTDCWde0F+dYCSLdDc8LPRyD9+UGstV216yuwURZ3GGlm
         otDD9YF2peUI0LjWtRa3NN2Pmg+wvGrOl/llPFg6ObUopYmNxd05ogt+WiP3w9TQX4SP
         vAb26a2YkQ8oc/+SEWlHPmsV/Tv4NWKquMwCWS8UwpYN8G7llvHnqYuW6ilUNmjcm4cS
         BVBJ+BM4Wew6AjXKWt4iUEFt9el0vRlMkkYZGo5aLzhBT6KS9V3OWMKM6YQmp4LGqsLP
         PJx282yV9iYDGapZealUtAxZRMeXCdYa8brFlGFYvgwOnJLj0IDINCAxLgZssl9xaAh7
         8yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750818590; x=1751423390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRoBVr301Z32U1U+wNWEV8kI1I28cFbSqrPbaNR/5yE=;
        b=uYAesJEcsxhh1nz/6iVU/QfNLEImupKXc98Ng692BvbDaicddavi1rQuz5kXd3IhNW
         2YfVBYVdBwLznL93f8CM46bVuzQCjAR6gKJxmUDjglTnnUhAp4A9xOpHmUAxg+Rkp8Sf
         zJT9doJdV1OS2+SJpShUs9WTZiuwoLiExjWOnUtpGqvvxHiy/+JU62tojt0J/E7BDVRU
         9NLpORO/hr3ivrmTiXHQ75TE4GFNM0MTdQo4uB7rCqFHAXgbZuLuIoN7oLmils/v2Jrn
         kPy7umcsWfPCByQT3KUfMg9AB83QETiTiwUwzyAJr75T/sUBMgTm0APyml3h9PXKF39h
         mPKA==
X-Forwarded-Encrypted: i=1; AJvYcCUQTIX1qLE69c3jcudcZPdrbMTD6Akp4cy1gHRqgDdNVS5Js2IHWY5HOAEbj/uq9VvwD/QTCTs1bTboVBFS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnhs8m1szXBsznMRd2PvLi3i6mSJwgmJmgNmLslqy5R0PIDeZV
	h0heln+H570gRrpxpFSUGBeBT4Di06Ak/apJSsjhUom0m93tpeA13nfFwELWnu1Shcc=
X-Gm-Gg: ASbGncuKrUIWeslBoY8oo4bMAjLcpTgitz70iB+n9b0AElrOUAbu5Jd2nGFQrddo5z2
	ACtuw0xPW/Im724KXujRiyDaJ/g34ELJk44MKCDD075Gupb2rsJ/Gwis5Cj+Mf5oVtVfsCRJbjE
	TF++3iQb7+LRvsXWQ4Y1NWMtYwvvhpnOhgRspENsXDJW0R7TgHG34FpcglFB0YGlrh5r+BfPDFG
	FrFujpM8ly8ZTDxAuyXQ5fYC7gfl1S+x9wHQ44w3rsSH9aIOew2GbzgRY/TQ4B4NMuxHZMuGBkF
	iY2DCI/ZwTzGGuMg5dn5p2N7H/mPkXqG9zAMT2yLkZLTPSWWasOT0IkikaO4TrYjI4dP7xG7/L4
	4rQqdpiZ1s6YU
X-Google-Smtp-Source: AGHT+IGDhzovgW8mfz1TgwEtDPLzMaEOkE7E5An9/EYwotB65YMux34Z99Rx+rpB+eyQKTmSPq1Cmg==
X-Received: by 2002:a05:6a00:2290:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-74ad44d861dmr2057195b3a.18.1750818589640;
        Tue, 24 Jun 2025 19:29:49 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08caesm3190947b3a.4.2025.06.24.19.29.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Jun 2025 19:29:49 -0700 (PDT)
From: lizhe.67@bytedance.com
To: lkp@intel.com
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	oe-kbuild-all@lists.linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v5 1/3] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Wed, 25 Jun 2025 10:29:42 +0800
Message-ID: <20250625022942.76489-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <202506250037.VfdBAPP3-lkp@intel.com>
References: <202506250037.VfdBAPP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Jun 2025 00:23:03 +0800,
kernel test robot <lkp@intel.com> wrote:

> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on awilliam-vfio/next]
> [also build test ERROR on awilliam-vfio/for-linus linus/master v6.16-rc3 next-20250624]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/lizhe-67-bytedance-com/vfio-type1-batch-vfio_find_vpfn-in-function-vfio_unpin_pages_remote/20250620-112605
> base:   https://github.com/awilliam/linux-vfio.git next
> patch link:    https://lore.kernel.org/r/20250620032344.13382-2-lizhe.67%40bytedance.com
> patch subject: [PATCH v5 1/3] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250625/202506250037.VfdBAPP3-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250037.VfdBAPP3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506250037.VfdBAPP3-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/vfio/vfio_iommu_type1.c: In function 'vfio_unpin_pages_remote':
> >> drivers/vfio/vfio_iommu_type1.c:738:37: error: implicit declaration of function 'vpfn_pages'; did you mean 'vma_pages'? [-Werror=implicit-function-declaration]
>      738 |         long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>          |                                     ^~~~~~~~~~
>          |                                     vma_pages
>    cc1: some warnings being treated as errors

Perhaps we need to compile with this patch[1] included to avoid build
errors.

Thanks,
Zhe

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
