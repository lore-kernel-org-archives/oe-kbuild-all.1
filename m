Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B00374DE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709193388; cv=none; b=jZZXq32gl60OjCbItUXF37I0s6DZRTEEEJJEtt1hqpqshYFxCVXBWeXwQNC43Pqm9da/c6M9JQN2rojl2FmjeSdJp2s/5Gtf+s2p4SujCLluWr8lHkA+8S7TW76YTOAPHfQbB9tT6i/47MZcdD7f77VnvogqDzK+/W8UaDsBsIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709193388; c=relaxed/simple;
	bh=q5m5axH+BLCl2agZv8n9DXtP46+hpfFVeTafKX3WiDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KiNSr3BK1BKqzgqO7LSBBjR88o7SOL7tn5seUIQFp5nI0ArnDUCQFkN3o0vL7vwj5RIfg21e33EXtoNrD0vIiL9erWotOouHKQo3VnZJKDn4sLt5hQEO+A8zSPgLS5HMU64bi8gmCyh43LObTnvgaz4lLmyrlb7fSNsWItfz/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVCiZHVy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVCiZHVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709193385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
	b=SVCiZHVyOpKDd8Rb+a1TSIVcyMibzkUsOw0AizCIdzh60HqThEkLHCq4EvOsitDRZNBdbI
	nd/GS4SX06DQEoe4AAGtGsecTer1Q6jyt72KZaT+bWpIq0Pjj0jAeT8C+PIRf5HnyherGh
	6G2I2X4Lge3oWbfTmSpsvKLiFYE0ghs=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-HqPtjT_HNzS2PvTQyT44DQ-1; Thu, 29 Feb 2024 02:56:23 -0500
X-MC-Unique: HqPtjT_HNzS2PvTQyT44DQ-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3651eecf80dso1091705ab.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709193382; x=1709798182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZYUQ2/MyEIs+wTU4JfVi5JkU9l2GM3/3Nd9NcCBnAo=;
        b=vE3Qj0EiwCHyxnXxOkMQfC0hfiHxfiVSQOQi0GBAbVyzJBeIDnjr070k5BajtjYoDr
         lZ/7Fja9HWdG8w9HGCIymgrkXnaSJnDDWBX307ZsPpNG8e7HI+/TMGwylPvLUxXIJUeW
         Cqixr7qcYzRc1nC1+r6tZNsRozfA6xzhlm31XfzqMBemJvMpFBkbfZsNxJre0xQemyTX
         Esg70VxpVGjoUAVm7kq7g4BYpm/8xWxMB0D3Fd6WfTfbfYsPiGBIxWTymokBqzeCLGki
         9+7ryCtq4/JrvK10hDQCDKU1Rk9OEpjgelasm3sHm0tDFJy90ryl+cDO1+6LVNNDxRLi
         dEpg==
X-Forwarded-Encrypted: i=1; AJvYcCUMj8I0HxAf5ba9WVc0EqaOkqSCUg1/EdwTQ7yu/H32FIug+o+lMupaR00/qEkTmLBTlnKIo0fIhHxXO9kFuXsCiXl6+yQGEBKYrdZoew==
X-Gm-Message-State: AOJu0YxxLXAKMBhstNWakswE5kgJ+kDGojQoFPFOqYS51N+kuFOthAEC
	McTB0sGEfeRqjbLbRJk/pFR1tCu2zsM7oPOFHvy7f+Wb6K2jdlvb/rv186XAzfW1MrwKpBrm5ZQ
	pYkvP7SNeO12AwS0X6H+WZweNg88lTeJNautx4izAH6fnq+d0/thgNyebfa7iB1A=
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725576ilv.0.1709193382285;
        Wed, 28 Feb 2024 23:56:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK2Caj/CnSM8btPacrXhbRxxuWkGYLUk6S0weGtsslNFGdZ2LEbvNGX15pEdr1SssPwwCMDw==
X-Received: by 2002:a05:6e02:20ee:b0:365:aeb8:26d1 with SMTP id q14-20020a056e0220ee00b00365aeb826d1mr1725558ilv.0.1709193381990;
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id ff11-20020a056a002f4b00b006e57b37a932sm664588pfb.9.2024.02.28.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:56:21 -0800 (PST)
Date: Thu, 29 Feb 2024 15:56:11 +0800
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Yang Shi <shy828301@gmail.com>,
	Muchun Song <muchun.song@linux.dev>,
	Jason Gunthorpe <jgg@nvidia.com>, x86@kernel.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 5/5] mm/treewide: Drop pXd_large()
Message-ID: <ZeA4m7DK03oHE1Kz@x1n>
References: <20240228085350.520953-6-peterx@redhat.com>
 <202402291233.CVhChP2c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202402291233.CVhChP2c-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 29, 2024 at 01:17:36PM +0800, kernel test robot wrote:
> >> arch/x86/include/asm/pgtable.h:1099:19: error: redefinition of 'pud_leaf'
>     1099 | static inline int pud_leaf(pud_t pud)
>          |                   ^
>    include/asm-generic/pgtable-nopmd.h:34:19: note: previous definition is here
>       34 | static inline int pud_leaf(pud_t pud)           { return 0; }
>          |                   ^

This is CONFIG_PGTABLE_LEVELS=2.  IIUC patch 5 didn't do anything wrong,
but when renaming pud_large() it caused this confliction, while in the past
it was a silent confliction between the old pud_leaf() macro and pud_leaf()
defintion, the macro could have silently overwrote the function.

IIUC such pud_leaf() is not needed as we have a global fallback.  I'll add
a pre-requisite patch to remove such pXd_leaf() definitions.

-- 
Peter Xu

