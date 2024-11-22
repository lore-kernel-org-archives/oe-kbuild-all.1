Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7590D176AAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 22:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732312953; cv=none; b=fkjkJkwuE9zczViRdQVE5gbd9RZD23G+6Gv3xOMGfexFAsbvUlbhyu2/GkRfiG8a6Cy7pyyKjNHPDkpi+uN9OQDe523UjDusEr0MGQxgNq9sw6Ucmjcdx6F3W9gu83qnt0CiihORwgSeYPUi+rLiVYvDJPJ6BJFK2G6NHV+PqYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732312953; c=relaxed/simple;
	bh=ykKAo7sEnG6ogfqSoVM5ICIKtWGlLhAzzJdQhZ59ppk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYNHNgrXwYJQvubvwXQO2zYkvzteO0mmCeibtc4ytuecwNPoYwMUCNztJ/d94NKIIb+F/VctMXcIz7eM76N+32Ch5INBSitVti5hg1MeOE6C4FJ4xOpcxYrsI+Y1e2nDleZGrgjrv9Zqfk4VO1e8P7TvOB/gCdqkkr/lhfvjOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aCfDTT7b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aCfDTT7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732312949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2rLE49z94TB7gVF24gYVB/BYnqK4CzBdI3lSpjsVG8=;
	b=aCfDTT7bEfUdncfx9QSZwlLejxsWhFyCehE+d8Rodze1xu2VwAuukEil+/a9/zNoKwxGAW
	sQcRmfwuPUhgIe0o86anAlaugbXYXxtQXnf2M9u+kjNJax19ngjLqKD6c94KCr8gzeoGJh
	/NRd0CUjRyMTJApRnc7/TRWjVR1ntgg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-IviwX846NP-OX8zB9CdVkg-1; Fri, 22 Nov 2024 17:02:28 -0500
X-MC-Unique: IviwX846NP-OX8zB9CdVkg-1
X-Mimecast-MFC-AGG-ID: IviwX846NP-OX8zB9CdVkg
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83ba5dcee51so48495639f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 14:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732312947; x=1732917747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2rLE49z94TB7gVF24gYVB/BYnqK4CzBdI3lSpjsVG8=;
        b=lwfaq3gxg6OA3hYu4Xx8oCSJRSkBg21fgMpj+dDGXrse5OyU8wMRAFlT4ebAosBjXB
         XAu3X5TAAXHA/ku44nOrjvOUTA1zt8WWIZCJqjLMJUsdE2XHKXEmvQbu6+4qxAbN9hQS
         jDeqZ39/XVQUctHcolct3XJABNGIZlNgmYz+AK08ONi9XBi7GLIhny6rR0OEa0FgreRh
         j1+zX50lSo2UXChhOiv3h3ROvetBcUQAi6EMRroE9FZnFRJdiZTsYDw50gAzQW5nAtwx
         0Vf5TaVOiFVSCmKI8ktCWDAPFy+5j7HnZ7mFrLH3cM14bjDq/BY3Q1MBbRpwDir6fFVm
         i7eA==
X-Forwarded-Encrypted: i=1; AJvYcCWNvN3khdryytS5q3QzEYVbGv+84wos8XuodJxsfDaAljGQ4RE2IMsSMZZhr4oMdT1KFWk7PoIgKjvqOD1L@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4OBYh3/sQTsBjkmpusGWGvuRkO93tVlZcGJcfnPrSqcoxgeHB
	N08XYweNoDh1i9gZ8635lJBk+0Z0qA4VQBcC2Sjhl3y1BXhsiKSH8XgBAgSi5tSRK4BI7+uwJsx
	Fywg+yJBat8I/5xiF1ZfcHO2wDekauSFU0BgobsKNoZU/MXHr4V+dF0VRjNepebw=
X-Gm-Gg: ASbGncst5hzcuCAhGBOwV+yv35vJuVJNeSRAJnMROzbChMLcLWB36Znp0ANR+IzTsin
	9YSUZYuSKvZxfQfbt9ytQZFVmK5wUPf3toiFe/zhgj/xWs/xtUx12iMH8XVEdWuoeRjT4sScBgm
	M6jRXjwKru5l7u3CrH+uxHmtTHj09yBPDkWexxqOWr57BD5JJXO7FnPlFXMRO/Tc8d5sIFhEyKj
	aq+P3iZOwaq8jqsZijNi05rHjpGIoQ7RV6LdKrLh3TB0xfzE78eiQ==
X-Received: by 2002:a05:6e02:1a08:b0:3a6:c8cf:9d5e with SMTP id e9e14a558f8ab-3a79b02befamr12879065ab.6.1732312947522;
        Fri, 22 Nov 2024 14:02:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN9GQ8p7p1EhkinN390sEetXzPMQLlVGkf1ufMAmQ34s/L5hM95PseqaFylZwSu7zEjU2HsQ==
X-Received: by 2002:a05:6e02:1a08:b0:3a6:c8cf:9d5e with SMTP id e9e14a558f8ab-3a79b02befamr12878975ab.6.1732312947196;
        Fri, 22 Nov 2024 14:02:27 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1cff116ddsm829785173.112.2024.11.22.14.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:02:26 -0800 (PST)
Date: Fri, 22 Nov 2024 15:02:25 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 kvm@vger.kernel.org, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH v2] vfio/pci: Properly hide first-in-list PCIe extended
 capability
Message-ID: <20241122150225.40029654.alex.williamson@redhat.com>
In-Reply-To: <202411230727.abAsDI8W-lkp@intel.com>
References: <20241121140057.25157-1-avihaih@nvidia.com>
	<202411230727.abAsDI8W-lkp@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w40Sw6KmG_RqJuS7Beezvl9rHnG5OmTTb44X4NSCZ1w_1732312947
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 23 Nov 2024 05:33:10 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Avihai,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on awilliam-vfio/next]
> [also build test ERROR on linus/master awilliam-vfio/for-linus v6.12 next-20241122]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Avihai-Horon/vfio-pci-Properly-hide-first-in-list-PCIe-extended-capability/20241121-220249
> base:   https://github.com/awilliam/linux-vfio.git next
> patch link:    https://lore.kernel.org/r/20241121140057.25157-1-avihaih%40nvidia.com
> patch subject: [PATCH v2] vfio/pci: Properly hide first-in-list PCIe extended capability
> config: s390-randconfig-r053-20241122 (https://download.01.org/0day-ci/archive/20241123/202411230727.abAsDI8W-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230727.abAsDI8W-lkp@intel.com/reproduce)

...
> >> drivers/vfio/pci/vfio_pci_config.c:322:27: error: initializer element is not a compile-time constant  
>            [0 ... PCI_CAP_ID_MAX] = direct_ro_perms
>                                     ^~~~~~~~~~~~~~~
>    drivers/vfio/pci/vfio_pci_config.c:325:31: error: initializer element is not a compile-time constant
>            [0 ... PCI_EXT_CAP_ID_MAX] = direct_ro_perms
>                                         ^~~~~~~~~~~~~~~
>    12 warnings and 2 errors generated.
> 
> 
> vim +322 drivers/vfio/pci/vfio_pci_config.c
> 
>    319	
>    320	/* Default capability regions to read-only, no-virtualization */
>    321	static struct perm_bits cap_perms[PCI_CAP_ID_MAX + 1] = {
>  > 322		[0 ... PCI_CAP_ID_MAX] = direct_ro_perms  
>    323	};

I thought declaring direct_ro_perms as const was enough to resolve
this, it is with gcc but I didn't test clang.  Feel free to leave the
existing declarations alone if there's not an obvious fix.  Thanks,

Alex

