Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FD716FF38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 16:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713372883; cv=none; b=OqZ0HikjwueF16CuR2fL+h5J+wvdHIw6xOJ3W2hG5VsP3MJSR8BBJfqenybz7rvFe4H8AOThCPZMVVWxeNDy1s1TRrCU0NjFxn7IWKTtW3+As/fUIxTeXl52E3GinMvKwRP6NDZwqRxIVk2q1/+/koJoHrBbaZvI4/55/zD9Mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713372883; c=relaxed/simple;
	bh=LZiGqLNTdZPpt4FDGqUwUBvpE/yno5luxXGD8zN4nDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jlpxBMfbGqpS0NH2rzF9Jm0oUArlAvJeTgU16FYj3qCOD4vkdsBm8GTJVrxqkAwIu0uE/49ZWHGU9WusxK7EbvlIA+nMTh8BTLlXqK8DtPh8zrCmyJpBqmF8f7/LcXJstrIXPX9GwNN4Tzyy2FCDuHK9IfvCInP5LqW1EOGqFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kjw2DN63; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kjw2DN63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713372881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pfdSfsDYqErxJUnuf0Vsxrj81l78d6tn6CxKCHFtJU=;
	b=Kjw2DN63Sv6niAIyQtNtdl5r7G4KC9FzPkOMzEDUu8VZDAORG+og+DNWQGeVGlbydzb8VO
	mI3MsJ+4pLATMAupXN9XQjlc47HHd2joVUuaKPeEqcRhP6+nqVG8GkqPHm/i48xqi+Rlcf
	hGywkEf5ZorUK9/Q8xZ5LzVvXdqn+2Y=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-2d3X06gaOT-qywohnneCBg-1; Wed, 17 Apr 2024 12:54:40 -0400
X-MC-Unique: 2d3X06gaOT-qywohnneCBg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-61b027fc236so2484297b3.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 09:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713372879; x=1713977679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pfdSfsDYqErxJUnuf0Vsxrj81l78d6tn6CxKCHFtJU=;
        b=vQ/kxO2pGLcSJF9yC3GrXlGxI8fGqmtGe5nRYXBVKbhlPPdSNypTyQsXVJXO/jdec3
         0RMZF4RyxvNMtIM/DKbhxQpZke6Hrnhfa+5YTqeOBsqbYVKD5uDzNnl72/yoFcyTls2m
         K3a5RoRboM2YHCpssuFd5/pYc8YaKKvMgmynTHpinn8t505WuV//H7A9afekcutmOiKF
         p7CF1djLxi4W/y6b1Tcpjb9HIA5ihE9Pe9v3YBds3kZxsVX0dfVxN1k86VPG4gRQucgV
         29Z8vAJmaNBUvpISwfAXo/ppDSbtb0leVVd+jkIRz+IjSU0wzyVIOSvH8+6FRLf7WpxS
         rNmg==
X-Gm-Message-State: AOJu0YxGT1P0lY11vMcohG383AmFRiA8/lyeERFJOlUv87LdWacSV40+
	Sf13wDXsMJ+sNAFbncnPb0EOaNaJFjIEYOv5t9L3TIKuTp6qLmnkMNYDCbnLY8mskcuhaRFBmZ3
	g/EvnC3XiGehub+u7qGjKH8V7fw/B0HUL0I1ZweiSxdMMB2nFNLp1GozAm0q7fXQ=
X-Received: by 2002:a0d:d6c8:0:b0:61a:e6c6:12b5 with SMTP id y191-20020a0dd6c8000000b0061ae6c612b5mr6316692ywd.4.1713372879169;
        Wed, 17 Apr 2024 09:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTmZXNb3HlX8X4x9Oh8ZDAGx60kf6R0AwLQP+t1uo+RSWiX7cFbrL3VDDHGtvShVBwlm+aNg==
X-Received: by 2002:a0d:d6c8:0:b0:61a:e6c6:12b5 with SMTP id y191-20020a0dd6c8000000b0061ae6c612b5mr6316667ywd.4.1713372878713;
        Wed, 17 Apr 2024 09:54:38 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id i15-20020a0cf10f000000b006a04a3d4fbesm465147qvl.56.2024.04.17.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 09:54:38 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:54:36 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6398/6705] mm/page_table_check.c:194:1:
 warning: control reaches end of non-void function
Message-ID: <Zh_-zHKPMp564sAG@x1n>
References: <202404171745.Zd13ydca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202404171745.Zd13ydca-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 17, 2024 at 06:01:49PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   4eab358930711bbeb85bf5ee267d0d42d3394c2c
> commit: 62754e4df9e04c4576e989f5ea2b909e824d8164 [6398/6705] mm/page_table_check: support userfault wr-protect entries
> config: riscv-randconfig-r001-20230105 (https://download.01.org/0day-ci/archive/20240417/202404171745.Zd13ydca-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171745.Zd13ydca-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404171745.Zd13ydca-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/page_table_check.c: In function 'swap_cached_writable':
>    mm/page_table_check.c:192:24: error: 'SWP_DEVICE_EXCLUSIVE_WRITE' undeclared (first use in this function)
>      192 |         return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
>          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/page_table_check.c:192:24: note: each undeclared identifier is reported only once for each function it appears in
> >> mm/page_table_check.c:194:1: warning: control reaches end of non-void function [-Wreturn-type]
>      194 | }
>          | ^
> 
> 
> vim +194 mm/page_table_check.c
> 
>    186	
>    187	/* Whether the swap entry cached writable information */
>    188	static inline bool swap_cached_writable(swp_entry_t entry)
>    189	{
>    190		unsigned type = swp_type(entry);
>    191	
>    192		return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
>    193		    type == SWP_MIGRATION_WRITE;
>  > 194	}
>    195	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I'll send a v2 of this patch soon to fix all these issues, after I check
with Pasha on some other changes.

Thanks,

-- 
Peter Xu

