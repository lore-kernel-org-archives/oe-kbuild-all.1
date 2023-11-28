Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DCB35287
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 17:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fVVUiW8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701191693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gtaSo1ub4uORnqknoH16PJEFq9uekg4hoFlfPiGwcdU=;
	b=fVVUiW8FP4DnZ8v8CBmhM9525r8tcftgC8Y9VWdQJRNSc/MroRagZd7N/4bYkmchh8bBg3
	Y++JZnuAS7Wu4A5BU3dgAvCZeFk7QSmCTr2kUD2LpKvTBhManJ7KwhvgSAswDKfGOoQu5+
	VRmyThl2uuzkMAlYXECBIIJC3Pvj8Ug=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-UooNRdsJPvGED0Gcm16YHg-1; Tue, 28 Nov 2023 12:14:50 -0500
X-MC-Unique: UooNRdsJPvGED0Gcm16YHg-1
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7b393151d4bso321561439f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 09:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191690; x=1701796490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtaSo1ub4uORnqknoH16PJEFq9uekg4hoFlfPiGwcdU=;
        b=kRqLRuNzGvzNZgLk5NXQhLQwG5mzG81P6Lt8oPRY2BAQ3UHocPU2s4OhBuRkEHm5Gc
         VynO+z/FA+tG6jgBMiXQ4ecHHjtJRyI3URBtSjQAum6xuUrDdesbRzK5oGHJXg2Z/qPo
         a0i3O2iDz1KEk2ARb65hpJiykosxdiu5LQuy8vWi9glx9Y/ZbInjSnM2au5S6xQ7mMPn
         /ByrMPgqCxHqJmGbK6eQTj6GvGNUFytx13OucNXhBZ9/FqRhVxCVNo41sP1U1vHDfXFA
         T0fB9W3TguvPfSfgRpih4zuXBT9PptguLwI1kBks5BpTFmRGuC0c0Cr3tn3RFR27bVs4
         xJXQ==
X-Gm-Message-State: AOJu0YzwwbT6V3Mh3219D34WC38zdxa+LIy5XxQ3Ap4e5DqlBcb/FDdx
	MCIp4Erp+tB/VTIWzcZExVADUJ4VM8STpiSU8WNnQZnv4eAzFFYl6fihuMMECtSkMaZDgOP42g3
	lHTV8GBaBnt31jb0TmUFeWvVeJg==
X-Received: by 2002:a05:6602:131e:b0:7b0:2037:68f3 with SMTP id h30-20020a056602131e00b007b0203768f3mr15000357iov.13.1701191689954;
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD6oEwpFjpUyHT/D0OGCBMhCVi5mSaIjGthKIjs5b6xAvuny8q9LhuouQv4++AjP9LEwy0Kw==
X-Received: by 2002:a05:6602:131e:b0:7b0:2037:68f3 with SMTP id h30-20020a056602131e00b007b0203768f3mr15000328iov.13.1701191689657;
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
Received: from redhat.com ([38.15.60.12])
        by smtp.gmail.com with ESMTPSA id ep10-20020a0566384e0a00b00459949acd10sm2956452jab.39.2023.11.28.09.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:14:49 -0800 (PST)
Date: Tue, 28 Nov 2023 10:14:47 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel test robot <lkp@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: arch/powerpc/kvm/../../../virt/kvm/vfio.c:89:7: warning:
 attribute declaration must precede definition
Message-ID: <20231128101447.2739afa9.alex.williamson@redhat.com>
In-Reply-To: <20231128124538.GO436702@nvidia.com>
References: <202311280814.KwQVhwqI-lkp@intel.com>
	<20231128124538.GO436702@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 08:45:38 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 28, 2023 at 11:01:45AM +0800, kernel test robot wrote:
> > Hi Yi,
> > 
> > FYI, the error/warning still remains.  
> 
> The patch is still here:
> 
> https://lore.kernel.org/r/0-v1-08396538817d+13c5-vfio_kvm_kconfig_jgg@nvidia.com
> 
> Alex? Maybe you should send it to -rc now?

Looks like this was originally targeted going through KVM.  I'm
intending to do a v6.7-rc pull anyway and it's relevant to vfio, so I
don't mind including it, but I think we need an ack from Paolo.

Paolo?

Thanks,
Alex

