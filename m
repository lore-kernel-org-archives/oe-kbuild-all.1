Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB50A24B28
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 04:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750652277; cv=none; b=BzTlE6Vz19YzAcQnpdntiCfALGRw1OZeXzLUZ49eWMu6FnvHJEIEBRMI1rC1L74/A31OG9a3oKE3w8551wem9s5krCy/AzCexcvwK6KeFXFZAJmHt5PUMjaaEr72xnbXqranOvGa/uFiqBiUMAX8gwwibXBJnVJ8MwC80cDBYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750652277; c=relaxed/simple;
	bh=1HCEUKiDpaxwIKbOobuNUi/NPcWVIro4j6yo0PNZjso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpE62C0uWymYzEh51eep67wOXjt8YqxFH7AsM6sqJSbb79d/xqk09AjoOqtk3HDEKma71qlfsMAmWQ0uDItMnVowFaAo3yqROmg4QhWSpxbuPwdDL61YzrTSTemhxXpUqOFvnsLx/CKhhAjignUZ9PKJiZA9fJs0We7evxbliOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ymHK0xoj; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ymHK0xoj"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2352400344aso37333865ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Jun 2025 21:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750652274; x=1751257074; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYt9p6UqrpD1ssIG4hq8VIu7FEVvetGvw10UOrK2Yf8=;
        b=ymHK0xojUfM0vQeaKZNFq1nLHah6Xou7RSsmjzOlt+RuPBLIbVFuMrwtKMkOxYdSLT
         Ot18qfAi5Aw7IcVbqx9OcolC285yUpnIHjdZv1NHAKbblOh5nr1t2wofRdbLehmQW3Nu
         ZyTKKcPrWxDVe1xmnKtZdZb6HuqTzzEO9p+sRF61uM5rj9HsR7404QNedDWEnZy1zvtx
         1D/4Q1P5yJzAbF1GcBgvILSiuKzjvQmVL3aCvpXPo0fb5+73Fk/RhZkhAFAcjvfmCanC
         BTUsEb3V0Io2rY0ogavqIJtPUnRJWrAzNmaqJrVvtHDjREp8uzCW9ibNDr+7i5/MFNZ+
         9RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750652274; x=1751257074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYt9p6UqrpD1ssIG4hq8VIu7FEVvetGvw10UOrK2Yf8=;
        b=uMlBzi/2KfCh2K1+ikCeOFbNk/J2DitvzEvLKyaJhOazP/XCu0/fdx6pmdFViVMZoZ
         BdiD2tlZQRk6gEiONrzGjNQOxHXrhDxJaxcEIYMJhGc5BBtqOJAwW+nVzekWlkkqgWlx
         M+k5Yh1tAtVtrX9U7JJsT6H4xwKFbKgZ2GsZkJ6pNh4fny6oz9nyKDej6jjB5xG9Xy7i
         YfTZrfuVt3BAWyqzgyP+zpaRR4k/W0lOvfbyKiq6RxWM1TgwaEPApJcogd8Dz7g8js/N
         x2D+4pyQf9l/lN9TaLhApNPFLq9yUXtjtLCuFvV4FtGhcH8cJGQlswZaPhGghqQfT9gY
         XsCw==
X-Forwarded-Encrypted: i=1; AJvYcCWwTtVkWPkjX+nunLtRDjeDrfMy3iW4+E3PHSuunetgQl8yB4tWD/8sHdN9HCXFo4TMnLyh+N+0ZuPC9r4u@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+xxiM5pj9/yXvtd6MBeGmXg/3DADdxQR3PUVFN39okZu0aGU8
	9z7IJNP4IqEn/Xx9c0xnqxdlVY5nckzcrbsEmxiTvlJcDIUSP/+ZoKY8iZOSPMmGyEc=
X-Gm-Gg: ASbGncvRyke/mqXUVR1xjMLwR68jexlYSOqiuJuDIl6p6JutciUoqKmlgPUIySNfWSP
	2tiirKVxWxOC20gf9ohv1wh5Jka0cCqc8ZnITvK+mf+LYa1qsqpBabQpVMC/oT4QZpCeWUBm2t6
	5B6XlifMmAdJLj8QWs+w2/Uz0ImL8ekeXmGWirqgw7TnvOevoZYA2x+6SkHbdZ1qm/bqwzRtfqG
	ikYD/jMPlilKu8IjN53Fxg9jYacD3MnSdxgsBdxNv3aX/SlYrL02GtKDaYphx8QE4emtR9GckkX
	ZO9EKVxqcg4sh2pOaJHwLhNjNjOF6pqYBByqtAVYpO2tDogoXOX8o26umcpCxOEciouaTMSWGQ=
	=
X-Google-Smtp-Source: AGHT+IE+hNWrxGONClNByOTsrrf99678X066DEPJZUZ2w4fTjYz8za/nPZwm34uDZAuZsVpbXjjakg==
X-Received: by 2002:a17:902:fa4f:b0:237:e696:3d56 with SMTP id d9443c01a7336-237e6963fc0mr79422165ad.32.1750652273884;
        Sun, 22 Jun 2025 21:17:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b000sm71723325ad.162.2025.06.22.21.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 21:17:53 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:47:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Abhinav Ananthu <abhinav.ogl@gmail.com>, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 5/5] Diff in
 rust/kernel/cpufreq.rs at line 1109:
Message-ID: <20250623041751.2ig7qdk4st4jajfr@vireshk-i7>
References: <202506202039.qBxlqL4m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506202039.qBxlqL4m-lkp@intel.com>

On 20-06-25, 20:17, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next
> head:   37bd81e08ed8a70e3c8a60225c51ddefac743153
> commit: 37bd81e08ed8a70e3c8a60225c51ddefac743153 [5/5] rust: cpufreq: use c_ types from kernel prelude
> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250620/202506202039.qBxlqL4m-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202039.qBxlqL4m-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506202039.qBxlqL4m-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Fixed, thanks.

-- 
viresh
