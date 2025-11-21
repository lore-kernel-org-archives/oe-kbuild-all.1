Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772ED36D516
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749682; cv=none; b=OdWX9QMaURK0+Hd1dpE7/CNH8iszK1M35J930IJvVeX/RpyacEJtV8ANIbp3prYKGOOpUcmm9aBRU7QJM/d9X6p/kmv6QVq6l/yfycRjSD8lu+Q3FPo9MY28KQxtTlYTkMtfQUzDfyXKvD3oMdKkQURjqdB/fDyoOW8NVO8fe3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749682; c=relaxed/simple;
	bh=eiNvpKMX+RHgtZkQ1+h3XWmFyZEgmHdrngHRg+aKUCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Dj7uh6JN3Mq4e21eJ4bFp/caZqF/DQAtlL0EMtcmZheVrRb9jnudXaGMApASgft9q3vOd2meDfALCVHfmzciGENjES5BbzPglXNzLwnOKE381SNcr0Hn18VWE2ExlhAXrvzx8znswTq0C4KmDyAZulIhgRghEmqK/Ug1jk9hPB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixfW7LEH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixfW7LEH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763749679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
	b=ixfW7LEHmaOV+ePy7IbM2owLZ4KC0mVFbjZ1dgS6FTFZaJYPrTjM0cEQf+CxzaGXmKNQaH
	AkiWGKzNmTZmxCi4+qX+FxUHTynRykr2AfaBeOnosshZfDBhM7LuavtHIxcIaOaQJVmXCz
	52Pqme4i3TJvkcSkomNATQXcNKs0hds=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-VdvjM06PNBOrAuzc1_NVxg-1; Fri, 21 Nov 2025 13:27:58 -0500
X-MC-Unique: VdvjM06PNBOrAuzc1_NVxg-1
X-Mimecast-MFC-AGG-ID: VdvjM06PNBOrAuzc1_NVxg_1763749678
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso942279185a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 10:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763749678; x=1764354478;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
        b=J2NvIBLLvP4Lcfiuis8p9iuyDoOA0r99CnnrrL/ZZIePEp2Bk8+w3QD3ulhP4gOGxQ
         cfPRP/xdT78X+UZv5vIcYlLeJ2/GbIUNVmtkZlZ5q0Wkka/ojNhPguarhJoodx0gXmJq
         SJJKT3FJlwYDU4nSMhYqyMcN/HKyoVKA6hBrhvm9ld5dTG8+0epGPkVuRQ/CZFswula0
         +OOLmmFhlYVX0Vo5xg7uI6I5YuDMzl+OynyUyFrKHnHIOWpurVZYfdFV/ViCY3xxF4Fe
         Q2iDjp/a8hKQej1gHIuaW/bSqZBc0bpKYtPFkc/dfd7slanLTTtM3HkLVpzlGguHyvbW
         ubWA==
X-Forwarded-Encrypted: i=1; AJvYcCVSU/ATyvXHIUMCyqTalS9yjathw86fWXstcbLfqb0IfVw9Lz7Ero1RIWqpVEdBMemNFuL/UhGqD80wK+os@lists.linux.dev
X-Gm-Message-State: AOJu0YxK4p//gVpmRFZ5H/T5NKwDKONdNrOUigRwakPzWn8VHRn+IgNC
	8JoIzDaJwBOTowaKrZErFMAfQfJJlrHUjwo4p068fnKa16l7LXjV94gz7NU29V+hx3ftTdczYT2
	cBIuBbBhkX19QVEMl5UUbqWq0K4WeDOv2LlC9OmZTYltqTucCGko8s/1KCpUxwWjcyaI=
X-Gm-Gg: ASbGncsc43VAIJlE93e+1yYgEmaBBds9DRZynONdquS29xqNUDWFUz6irE/OLKaTqDw
	BhAUTAeu8MaHeQ+CLcQWg6lgkciQy7P41W1GlBLnT4eWtPOAO/NXBBxqs7xiBf3JFKsfQllR3z9
	lekJgcq5+Pkq1nb/mZBm4QmyMPVt5tm7LY+R1SSCRCRpC5YHczzmzopF4EuwPkwfZAhJsZj3GF/
	zuzEiycqAoeOdk3snZhj/Pf7CV4aoFS+RhQ6LP0nAP6qoAMltyTA1hYXtiUwEjI7KNuoD+wIhF1
	OPAS+tDv+SrzPHmQfIUSCk9h/zL98/a8kS5/CuXD/HeJvkm9PDelHi6J8ywH+BXkUbPBA97AsP3
	I6UxZT0zYfQ==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387661cf.60.1763749677522;
        Fri, 21 Nov 2025 10:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkOzQWoZuQdAiXMy2SX7/W3kkLRTcNrhy9ckhF61k6Ze2u2Lmzw86pdU9Kf7yewixDrfgpEg==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387001cf.60.1763749676867;
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:2fb1:d1df:b122:3b2c])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ee48d571d0sm41831021cf.12.2025.11.21.10.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Date: Fri, 21 Nov 2025 13:27:55 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
Message-ID: <aSCvKy64s-LBrM85@earendel>
Mail-Followup-To: kernel test robot <lkp@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-1-883a94599a97@redhat.com>
 <202511211008.jgLuTcrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202511211008.jgLuTcrQ-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kal-rMlQ6dcslKjay1Wlgd6dRUm3X6pEYG-lSF1XJgY_1763749678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 11:00:32AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:

This appears to be a generic issue with UML, unrelated to this series.

https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/CONFIG_UML.20maybe.20broken.3F/with/558611169

Thanks,
Peter

> 
> [auto build test ERROR on e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Colberg/rust-pci-add-is_virtfn-to-check-for-VFs/20251120-062302
> base:   e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
> patch link:    https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-1-883a94599a97%40redhat.com
> patch subject: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
> config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511211008.jgLuTcrQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0599]: no method named `is_virtfn` found for struct `bindings::pci_dev` in the current scope
>    --> rust/kernel/pci.rs:415:35
>    |
>    415 |         unsafe { (*self.as_raw()).is_virtfn() != 0 }
>    |                                   ^^^^^^^^^ method not found in `pci_dev`
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

