Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26F27146F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 07:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755503850; cv=none; b=kE7LT2T3wXp9gwCeLON8tXBKSitTlZu3ejAmdd5+JSRdbvNlLICSHA9zzVtdSWlJdbhy0EB741vw/mEzSdAlTkZOSSMnvMQRebJx6J62Lff0f8R3+xirjz0zWW8uHyWKaFPojEt7LuwRaFWtPVfSJ1wGiBDd/qp1TICwNIDGqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755503850; c=relaxed/simple;
	bh=UYGkkspU+B63sm92wMSzq+haWmbUPgKrQyQjqaa8St0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CxIsZnasRcYk07V50v7O3U659zssmP9jo3tfTwpp3OFOfWyoJHwiePJ7J0jQbx0BZAZhMOFNUOoKA3as5s25Z0/il6onR4rbhYdUHHiUdrmH5tMkSG+HyuiogTg/HWPbSfsLJhAk26tYb/ov/3PROZdOxswGDFzURKVrxM6cScg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IpX+3PHp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IpX+3PHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755503848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EnLNVOy+1JPODpJ3Yc7eupS4dHoP80nfXVqFC6FlADI=;
	b=IpX+3PHpdBjDGnmuoTCTjzZAulx3+QEB1Sg5hGHsWtu4du2XEInP/7YbE2OQIQa4/YRmwc
	xVojIbxjw1dQ/H2Pbn4Ci6fAhwBhEsY46XWbIJ+Vb+tbRS4coGUUCSg8obJcglkZNyNkj4
	T0gXx4/+UqaOb1YTeilZ5y9khb7kRTM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-yITsVGIQPGi6d4LGpgZuaQ-1; Mon, 18 Aug 2025 03:57:27 -0400
X-MC-Unique: yITsVGIQPGi6d4LGpgZuaQ-1
X-Mimecast-MFC-AGG-ID: yITsVGIQPGi6d4LGpgZuaQ_1755503846
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e864817cb8so1409137185a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 00:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503846; x=1756108646;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EnLNVOy+1JPODpJ3Yc7eupS4dHoP80nfXVqFC6FlADI=;
        b=nRCIubEltkf9wdAhI9mou7TSyCII3Y2l6aSKcjQAfJeY6OcNph62p6g6kfhF4z1LEH
         yuMIgsZdfSskQOiH7tsJG3QKDsrR2cy/30yaVyGgcIXgXAaWF3RnJrSFmMJXKEsVAeyK
         5nNz5DGVeGUxKBlZ2FM8NtGG2rsBjXHO7F4Km3VlOEfbYvM1yYAaZBoxpqqwal0B1hPs
         1adpOsRykPh+vbzUizh9M1T0hpMRYouRcBO37+FrxjmZ1nptol07QClbyOLis5RkhklO
         N5Gh88T2TJR5s8yRy9C64/usPIlGMBvD0iUMyBQ9FcOU7LUfLiksHkMIYWO11c9O22b1
         zVGQ==
X-Gm-Message-State: AOJu0YxvLVgwV3RDHHOn2PUKdFLARTCoHcUnBkTJOvLAk7vGwegH19tO
	6Y6J8HBBIwFLhxG4l5gOPkIhefxpKf0gDA+q+FCc9SSZL2yv+yvbRSywDMoun8/zg5ohY3B8wyC
	TtB5ka6gfQdysM23/F60trlj/VUT086CEbfvOkIE8uIXCrNsgxRYoH0wPLmqQJImnekc=
X-Gm-Gg: ASbGncsQATt2YSy2ftnkl75pFqZ5msmt+6aB3YUWPTw0/lPSKh7MZWlHO0bqQl4+XTC
	iMkOeuxdBRmT2Qtec7I85Yp+k8R61NeYOG5G4rx4Aa2mVgRjvhbrX88j45eUoHfVGMD6XfflG+M
	7DSSYBxSApyxCE9sqnOfvCZ7+b3TZeNfpj15tS3SAnIEDCsTY2zmFNB6acemGLBbvrXZ9tkZuEx
	7zX2r1BR+R426LUXFBzB4YOmqslp1fjYQZCR5540TRGPor2Jh7kjNpHu2LpPeJ3Zuct7u71oLon
	9SICPP9IQIumaPJ0e/7fOX7tInpDbDq5WTc=
X-Received: by 2002:a05:620a:8395:b0:7e8:8fb7:fe8 with SMTP id af79cd13be357-7e88fb710acmr709375185a.11.1755503846505;
        Mon, 18 Aug 2025 00:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz+Y7q7Cu1RnQ2whkcwKktuyquYKEHgUyH2v14hpiHFQmIn3M88eiXtWwjcl0ERF/6wn9BUA==
X-Received: by 2002:a05:620a:8395:b0:7e8:8fb7:fe8 with SMTP id af79cd13be357-7e88fb710acmr709373685a.11.1755503846133;
        Mon, 18 Aug 2025 00:57:26 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020b3dsm545707985a.12.2025.08.18.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:57:25 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kernel test robot <lkp@intel.com>, linux-hyperv@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Nuno Das Neves
 <nunodasneves@linux.microsoft.com>, Tianyu Lan <tiala@microsoft.com>,
 Michael Kelley <mhklinux@outlook.com>, Li Tian <litian@redhat.com>,
 Philipp Rudo <prudo@redhat.com>
Subject: Re: [PATCH] x86/hyperv: Fix kdump on Azure CVMs
In-Reply-To: <202508161430.0GC3nT8J-lkp@intel.com>
References: <20250815133725.1591863-1-vkuznets@redhat.com>
 <202508161430.0GC3nT8J-lkp@intel.com>
Date: Mon, 18 Aug 2025 09:57:21 +0200
Message-ID: <87frdpm59a.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aZL8hIwo0eb3QpEOmGDJ8xBuuQT1gs8V8CLfdWnf5Aw_1755503846
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:

> Hi Vitaly,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on linus/master v6.17-rc1]
> [cannot apply to next-20250815]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Kuznetsov/x86-hyperv-Fix-kdump-on-Azure-CVMs/20250815-214053
> base:   tip/x86/core
> patch link:    https://lore.kernel.org/r/20250815133725.1591863-1-vkuznets%40redhat.com
> patch subject: [PATCH] x86/hyperv: Fix kdump on Azure CVMs
> config: arm64-randconfig-003-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161430.0GC3nT8J-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0

Rats, I completely forgot about ARM, will add a stub to
arch/arm64/include/asm/mshyperv.h in v2.

-- 
Vitaly

