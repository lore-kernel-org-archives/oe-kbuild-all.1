Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B03A3B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 04:51:31 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f13so48989433edz.6
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 20:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677646290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf+wA0QmNX744Y/lqGbk5s8jA/7sYEQ3hy7TeNz4kew=;
        b=pCA6Ljh4YKyIGCpT1BNzuO9x2bh11eBXyZyOsb9ptC6dh/5VcgqCTWi7qpMGikNF08
         YsPEe+hpHlUlz18KRgKLq1YJFNnEYmTJuAGD/SHyiT9KphbG6S0wXokENQLD4deb/Jwk
         hdUSwPhM25zLgT2xAONeORenH6Nijgr2iBW8EckgSKSSZmf6NzIp8VBFdJEjOSj2TJi6
         Sr3WqYrlsPqFZlrH3eDR0jNqv5gRTcnp8CcTbNCfNS0It6LEZV1uh+IPFWkQC5J2/7bx
         qkqQrZN/8MxE6i/judZvVCC1VJKfj6uJzYC2+M2B19JGub2sf4Jxd7Pf59mUXZcMTjrJ
         6VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677646290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf+wA0QmNX744Y/lqGbk5s8jA/7sYEQ3hy7TeNz4kew=;
        b=SCmz5Jo7fRo4Jd/uUyMunhL31J6IjCwxPuKxgIdR4mJBAMO3agcV7mQZvmhJAR+Lrm
         o3EeNyOTaZrYAUhwyUPuy07F7iPQ/cER8CXAmhgDWzcdwTspFVNOqsFgZXx3n00VqZL8
         8lAsnRgTR4lJ0+TC1h/m6Y1AQ+x3zerSE8hOMDP2chVRGUgxdc4IbHlHTCawlbLrBf4+
         00IEzffqfR7N0zuzHouNNnXimqSBkDJrtgqCmVf8URe5kYd2Yg7i2GCVnk5ApbDmBx0m
         mrJhu4CKe7DreHOibmpxVTna+jA072DvllHsmab723U34h1edIjC8U3+jbU5itLwbBUd
         9P1A==
X-Gm-Message-State: AO0yUKVBHU9VqSVnrCdk0Mn7H1GHrOdiTSO6GB3+6nTeaAuCYN0L3GRL
	ZOIqpvFK6L96OdOW+ggUlCaOA+whmEU=
X-Google-Smtp-Source: AK7set9HU0yaQDE1GWWPN+7uNOH/F5KxOowwGZT0/tEUbJRb+E+f1nW5HWpeHLPT1xS9R24T482TTA==
X-Received: by 2002:a17:906:85cb:b0:8b2:3e72:1022 with SMTP id i11-20020a17090685cb00b008b23e721022mr4520088ejy.29.1677646289960;
        Tue, 28 Feb 2023 20:51:29 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709064acb00b008f767c69421sm5205731ejt.44.2023.02.28.20.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 20:51:29 -0800 (PST)
Date: Wed, 1 Mar 2023 07:51:25 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: drivers/pci/pcie/../pci.h:325:17: sparse: sparse: cast from
 restricted pci_channel_state_t
Message-ID: <Y/7ZzYyisv1ylrho@kadam>
References: <202303010454.jI5Jg2sT-lkp@intel.com>
 <20230228213325.GA21769@wunner.de>
 <Y/7YN7U9Q2iqNDFo@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/7YN7U9Q2iqNDFo@kadam>

On Wed, Mar 01, 2023 at 07:44:39AM +0300, Dan Carpenter wrote:
> > It seems they are only reported for architectures whose arch_xchg()
> > and arch_cmpxchg() macros cast the argument to an unsigned long.
> > Archictures such as x86 don't do that, but a number of others do.
> > The 0-day report, reproduced below in full, is for loongarch.
> > 
> > I'm wondering why the cast is necessary at all.  Digging in the
> > git history, I noticed that it has existed at least on arm since
> > forever.  I suspect that its use on newer arches such as loongarch
> > may be due to cargo-culting.
> > 
> 
> Speaking as an absolutely newbie and ignoramous, I can't see any point
> to the cast in arch_xchg().  But I am also surprised that silences the
> warning.  I would have thought that removing the cast would change the
> warning from "warning: cast from restricted my_type_t" to
> "warning: incorrect type in argument 1 (different base types)".

Your other option would be to add a __force to the cast.  I don't know
if this is a good option.  I guess first figure out if the __bit_wise
is really required.

regards,
dan carpenter

diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index 497acf134d99..387c6af01941 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -93,7 +93,7 @@ __XCHG_GEN(_mb)
 ({									\
 	__typeof__(*(ptr)) __ret;					\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+		__xchg##sfx((__force unsigned long)(x), (ptr), sizeof(*(ptr))); \
 	__ret;								\
 })
 
