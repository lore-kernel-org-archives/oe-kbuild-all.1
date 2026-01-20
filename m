Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624C043636B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931208; cv=none; b=of5Sdvi06acTXz87rKC93lVY7rmDS+JEuVp/kZLrtr6oOEfWp1/zsQZE7Vpe4un/6mNndBiDURfj8DBHpfeqDGN9puv5eGmtKLHaWULNGeUe8P8Mmc4ZNWGuCj6bN6fkQlDLL2V856ZjRY4zw4Gki8AESGBrDBeONW/5bIszbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931208; c=relaxed/simple;
	bh=bsHD5ASTyZQ6NgkQHF/MszE1ynvH2TtdgFI+ciczVR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QXaOeyoCjlgF1v06S0hwDHCX3O71ZPCV0z6MTOWwgiE3MfEFqlP0ssA14Rsu3Y9aaFB7a44rktqbB8x+hTSviugdZx3s5UkJh9hhaBKt3+fFlq6rDLNR4T2RtbdwaIPGTVpULuOhxHIQUnF88bO/wm+la9U9YJhlrunI4LfkNoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aIPV9mc4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aIPV9mc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768931205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QFl9G2ldA1TW7qySDFacMiOzzulOTOkp01NTA21hmOA=;
	b=aIPV9mc4B5y06Ks2zOhhQtrt5MV0hzkpyUXyE/NRHDwOD7biOyH8xBIDJ3OT6hgVnMTa1R
	Fs0ZfhOz2HoJ5CbGSWSwjHVehjlz3mwioFUNGw3K1AvWIXJDTSgD/SoFXKolWnDhLVrXI4
	UYXixGVQhRLXGFxSVFJEKq4NH2NBwSo=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599--IiWbtOhP4SoI8X7npFU4g-1; Tue, 20 Jan 2026 12:46:42 -0500
X-MC-Unique: -IiWbtOhP4SoI8X7npFU4g-1
X-Mimecast-MFC-AGG-ID: -IiWbtOhP4SoI8X7npFU4g_1768931202
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0531e07e3so5185947eec.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931202; x=1769536002;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QFl9G2ldA1TW7qySDFacMiOzzulOTOkp01NTA21hmOA=;
        b=J1txUQ3MpLePG4upEpmo8ByD/BhOpSoDJsc4zHpGemQxGv+urMG3y/RyJsor20viLQ
         xwzMopZBeuP0ffTKHveEGLLbEnjhYu56SevpbXZrSfHtrEIpZgEaV+jTiWFpmUaT4isX
         KRtixvZaXGEhc0/f51ceY6VQwzB8DS4CQ4LLu9Ea7F4Nrp6BhpnfdfG77yBww9DyUgUX
         2nXiEeiDlEvTPavJ9/QW7YhazTxrJp0ScOxzrWDKhUlOka3pcE41Ufi1psAFwFRAeSWM
         ly+LM1UTbRUi1sl/sNevysGd5etTKXqXOETtscBa+SW+Upe1m87RKFoAVQQRqp4rRsWv
         n4yg==
X-Forwarded-Encrypted: i=1; AJvYcCVYMLur1Q2Byp0HojQpLNkOy0qkO/jPf63dHNqqfG+mJzDJEQQLTKMXOT9+jm3ZBex0T1hsRv0bLqpYvS25@lists.linux.dev
X-Gm-Message-State: AOJu0YyweQAF7PLrx5+7zWNjK0RysbccT1gzR2sinP1TmYl81ACnOPsX
	Vt9sDmm/OHJJ0aA6MzIls/4HtoWHmuWLu/kzhuimqgV92N6l7L+tb0G5zfenYs/lv+tKCsWcfLa
	UEnZ/Nn11SAMM39BGRs157FAT7ghDVEFnC80j9CYn2zuaE7fNTrLUlYWJp1oj/k4F3r4=
X-Gm-Gg: AZuq6aKDRHd53ii8bhQwWyaIdufxHAppX7tOR3p6HesJnoFV967Hd0BijiOyOcKq+B8
	CCRSdeZORIx4fUclXh0KV/uU5dwIJKwEiniMEfiUnbQXEOXtpuzc5GXnCWpCIX64FB2K+M7XREY
	XwibnNtukA3CYgv+m+6avl4yAbj4ZK9HkBziQsDRdhctdi1otZxI6shPL+8EiXQkc47BwvvGOCO
	fXWI1oUMUnDy0nDSsqD2xVDYRzTBPr2DDAJa5X4WQOs5ymHBdTO1X0Y7qge1XMOBVMODs62Xh3s
	VzGpOZX6Tv4Z++T0s8xf6xuvJi/PimrFAX4TdydoQ+2r6DoIxj/4gy+7zXpO4b1++twMhF0Rr4V
	23CRMqVWToyfXZ2a4kXQE+WmSb3fE/7ofCBP7FnjDklkP
X-Received: by 2002:a05:7300:e8ac:b0:2ae:614a:330e with SMTP id 5a478bee46e88-2b6fd7bd308mr1523549eec.41.1768931200196;
        Tue, 20 Jan 2026 09:46:40 -0800 (PST)
X-Received: by 2002:a05:7300:e8ac:b0:2ae:614a:330e with SMTP id 5a478bee46e88-2b6fd7bd308mr1523481eec.41.1768931198215;
        Tue, 20 Jan 2026 09:46:38 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3503ce3sm17858047eec.12.2026.01.20.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:46:37 -0800 (PST)
Date: Tue, 20 Jan 2026 12:46:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aW-_eIjcRp7VM0bt@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162110.K1eWGORM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202601162110.K1eWGORM-lkp@intel.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZFzE9Xooj0jGAbTa_VhcOW2G3O5nqL4nSTtIsnCUBdM_1768931202
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 16, 2026 at 09:20:36PM +0800, kernel test robot wrote:
> Hi Brian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on f417b7ffcbef7d76b0d8860518f50dae0e7e5eda]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/MIPS-copy-pic32-h-header-file-from-asm-mach-pic32-to-include-platform-data/20260110-005057
> base:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> patch link:    https://lore.kernel.org/r/20260109-mips-pic32-header-move-v1-13-99859c55783d%40redhat.com
> patch subject: [PATCH 13/13] clk: microchip: core: allow driver to be compiled with COMPILE_TEST
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601162110.K1eWGORM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601162110.K1eWGORM-lkp@intel.com/

None of the errors in this report appear to be due to the changes that
I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
architectures instead of just MIPS.

Brian

