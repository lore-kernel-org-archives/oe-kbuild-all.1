Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D325C702
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277664; cv=none; b=DvSs+CI/x0JUgr6rjO2jHvZhdfBm+XKUYUvLWy4F2Sfbcsz4g/prEbRFyr7a73B8gIdPPZigeLcqyjwfVx9YoAH5OBYKLF7P8gDxGp0XgjTU9Qc/0Mc3ssg7WyR4T4wo2vBVXNX9Q0k9HX1ETkOKzREphp0Im5RsYGepniG24R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277664; c=relaxed/simple;
	bh=yPhdlISTOreQ/aDX3Tsax/TWfw54sQsh5jwQ3cEiy/8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH+jmLGroA5gnmMoAusbvRA5410BUJm6XUQlEdMlcS3M7xzBAwxBduCCCKnXQ+9BG4+YUMfKo2ldeoo4A11ufNV8TJWD82y2OwOzhx4v8wt58O94GgvpqnpFbWAz+/y+aFPIjIBH5QjITkmmx1Wr91PNNKJQLnxBaW3Dg6ECLzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTR9+JcN; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTR9+JcN"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db2c2c609so5841821fa.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Apr 2025 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744277661; x=1744882461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnbKxA6lsZP3NTEmyhRFBly3B+ZmNr9pag5vwciMRm8=;
        b=BTR9+JcN1rrP0GGEnaRVnTWURTugDkgcgEtuthBzxHORTAms+b57Wz6hwzcqCbhtLD
         ElhKPUzkxdQH0vjXvXkNXsBoOlA1W4HCPhAkn7LYZroFzO+KUigV7EEFaQRkO/2FDL7/
         8XNilL9cDaL1+aIdjI50MThl9atWnKjDAqbbpb5FTdZGYkWDoye2Alx2HtLadAlBMwMn
         mP7oiiKTYBpch1sRd4WUzulsDXNKXCukuWzulFQQ29gzxNnT+sjAACFHKA09D201d7jO
         ewCLeBEUPAqvTFDPSBha+IBIxh2XiJbzR6hEGbP2A4BBNB6jlB54GomnsWWj/dl3C7rJ
         ypsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277661; x=1744882461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnbKxA6lsZP3NTEmyhRFBly3B+ZmNr9pag5vwciMRm8=;
        b=YtCMb63AEtx+UvQSZBw7DJay1sBvslRlVBIwU0oiZr30VhlfF+B5ObqMnOb0FjavNT
         9NLc8jGxzV06ss+ajhagGcOyqsZ8o0pOQlqj7H5Kn0Zb1RQrGnwNSEtZpvrei7XEG7L2
         qcNAma36Nt4e317c2/xw+iNkI7zxYUnWPQma2avFfiIZDKvgOmzt/8m0WhSxPbKtx77H
         lRcZlh4TGnQ5+amBFe5G9AtmhgHiGifiCJCL4VAdljQPQAd0C6Jmi1BuhELZ4j7UTGvL
         3wVlydv8DGj4hsOYCvLFunbH1P5HrxcgAwWCkQPxFqebtK7eVzVu///Eg3rEqmqBRppU
         rYbA==
X-Forwarded-Encrypted: i=1; AJvYcCUw/jy5z+fv5268wo2niaI58RmGJKReqDyouRCGlzHYEQANVHXPV8SDZh61Jdniq2j0CgKYB0wfVjYizKHe@lists.linux.dev
X-Gm-Message-State: AOJu0YygnD0GnjuzdsD1CfXaFvR1QRGtGh0J3fqDiDbgo8IWIREsQ4hB
	3/JUDCLY2HY9v/elFmM38+DpCBYw4Jvfo68/GiuNUDbbpMcSHzPH
X-Gm-Gg: ASbGnct8a+kVxRUDWrWpymgLvyQZE8z0mkrBKP3Vfr7ORsSCSk/wIHPF/J5e0OIU7dy
	61BvL+HMEDbGT/6+tZLnwCgdQwD2WMwDagrt9E1iAxSwyx/s7cS/v+4z9b0QZhOTxJsm8KtdjfI
	7ynWD4SfICaiJK/IS5EBnP3HGRKl4R07nSaqdNbQIq+lTSVsoaMnUo2KDaLuVV6Hpsnegkv2xrb
	xCyxWyP656eNA7nwEXNzh4SBt+j3+ZzbVOXUGW5Zl8Tol+dEHS5xFp9ZLI0e0LFsyE/fDLAverw
	p7joKawmnHxaATFbp3g/p6/EnQQRoVss2V1zewLvkRjlgJujb2orwLaaQ8qqHeGWJV6nQ4c=
X-Google-Smtp-Source: AGHT+IGncMzME+9f61iMxAYOrzMSnbuBplArYyFnuUwO4WDMRKBFiYikSvdFy7p+n78+o5CKz5ZdzA==
X-Received: by 2002:a2e:be2a:0:b0:30c:177c:9e64 with SMTP id 38308e7fff4ca-30faccbcc09mr7438541fa.35.1744277660721;
        Thu, 10 Apr 2025 02:34:20 -0700 (PDT)
Received: from pc636 (host-90-233-203-182.mobileonline.telia.com. [90.233.203.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d509bsm3982621fa.84.2025.04.10.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:34:20 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 10 Apr 2025 11:34:18 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>,
	"Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
Message-ID: <Z_eQmixxWJk-Ryi3@pc636>
References: <20250408151549.77937-2-urezki@gmail.com>
 <202504100130.OjlBJLkQ-lkp@intel.com>
 <20250409173217.ff56242a21b4edfe9ed87e57@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409173217.ff56242a21b4edfe9ed87e57@linux-foundation.org>

On Wed, Apr 09, 2025 at 05:32:17PM -0700, Andrew Morton wrote:
> On Thu, 10 Apr 2025 01:39:24 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504100130.OjlBJLkQ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    mm/vmalloc.c: In function 'vmap_init_nodes':
> > >> mm/vmalloc.c:5087:9: warning: unused variable 'n' [-Wunused-variable]
> >      int i, n;
> >             ^
> 
> Thanks, I added
> 
> --- a/mm/vmalloc.c~vmalloc-switch-to-for_each_vmap_node-helper-fix
> +++ a/mm/vmalloc.c
> @@ -5084,7 +5084,7 @@ static void __init vmap_init_free_space(
>  static void vmap_init_nodes(void)
>  {
>  	struct vmap_node *vn;
> -	int i, n;
> +	int i;
>  
>  #if BITS_PER_LONG == 64
>  	/*
> @@ -5101,7 +5101,7 @@ static void vmap_init_nodes(void)
>  	 * set of cores. Therefore a per-domain purging is supposed to
>  	 * be added as well as a per-domain balancing.
>  	 */
> -	n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
> +	int n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
>  
>  	if (n > 1) {
>  		vn = kmalloc_array(n, sizeof(*vn), GFP_NOWAIT | __GFP_NOWARN);
> _
> 
I was about to send a fix for build warning. Thank you Andrew for sorting this out :)

--
Uladzislau Rezki
