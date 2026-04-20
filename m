Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0222A288C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 07:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669703; cv=pass; b=oVUK7Hm3xvf5pXHxyxYTW1AoN3wfQJ4NaC65YT1Opab3NXvwk1VS0nO3JFHGsDb3Wy8iDt5wbyhbGfhnetHmVvjG8jeXuKi3cnyibed5wy3JzETft1qS/e/68JyYnUvHbttOKgdVRzVut7/YqBz1sxWkC5WHzIJZyQwi5MogU7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669703; c=relaxed/simple;
	bh=pShJMpiKIthjvUlVyoUWVbQFUe0TfY/dj+PX7QQsayU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TSo7REK+qbfa6PGkz8ajlZUzb36iD8Pg2hhEp5mjOqhChrbGpx2S2rfjd9cb938/+EruJZl+9JuwgNBO+IRvhbgwl5nypIdZozPpVB9uAkDqx114NbxqOIJGN3WYxHtSuUpg43eUTS6nrFp1eFouzF3e6tlRd5VK6qjFQp7XjIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzTFmpf2; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzTFmpf2"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4233e152457so1913610fac.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 00:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776669701; cv=none;
        d=google.com; s=arc-20240605;
        b=dBm/ri75q1qai9VhiDcCic/qAU3kVRYIoomNzTQtPy4mUs/K3xxo6cWzesn7gd6WVO
         hJI6Quob0Wf91tYKyZSJ/xPfDsIDgZZZFHx2N+lMb+64f38iIyp2vJLkrUxEOKzvTNlw
         kTD0+Mnxe5FOvkWT1LgVbMCP3Lno9gwQSpHSUI3RjH9bzMqyMcmQgURHm/KMXw54zTqz
         wyzrr1xRspX8szVFB6RRRBIEJmXrf423CmkwAplThCI6GX4UDGYKVDQJofZfRDHD/Yao
         yYBwp1K7dKO/YP5sI63K9H/IHp/k7aB6SpZGDehiOj0e9GmbAQQ5L8CPcMNF6hPn9JVM
         F9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDv8kzY/wvtJwMF42UK7u0PfDikhFNNgDHqaPIhIY5g=;
        fh=sjOxa7VIbF5lcoGLeEG72FbutlgC0qZNBcAQSWTDb0U=;
        b=Ql9LDnlpFlvPPhKscTxbhSjE0jFRLMqIhZZoQeCyTSapr74rs8agyJvueEcHgTrH9U
         0g1d77VBNVurqds+k6qSU1NKQe52WB445ukQAaCxYM1jzzYarFoIuP/DZXZfB8ZafTFB
         dR9/DJV44+1KclGxSIK3NMFdmvAiaKQFQB90LhAC09RsTUwXwTTjUu1CdGALGItx7FPl
         Fot/hfws9+pVlO8xQykJoAXVH8J/KJOJE3ZVw0x/4JdCV6X3PqBdN1RMqxu1D6TOx8QJ
         X2kfu238fqcRMw0qCVvnOhjCQ+DqkTNA5g/zpKW9+h0Z7ZP7hdg04PXyYlPg5+VxvISs
         eP4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776669701; x=1777274501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDv8kzY/wvtJwMF42UK7u0PfDikhFNNgDHqaPIhIY5g=;
        b=ZzTFmpf2Fybg6Xqk246k3cAvOGNJzXiNVuBGD8jCeV9q5Kb0MAnYsiv7dZPC9kmi0+
         x7peLZ4M5z9psZUYQwAMuOsGta37T05tWKsYMMSSZ2yVEg94pVZxj3IlNe9qp17wki+G
         DNxEX/mi+MQ6Ek8L4BnrYLH7AgP8ueptCDQ5TA1mYUdJwsOuit5OlyqQJu9N74MPcPXN
         +z0nVCF2kwwcNpZORM+45e1QglL909+HW77Hw8dNWzkESyhYDZKggfIDjE1W3Y2J3pH6
         95jWAtouup9bi5nB+EWwYrWes3VE5DveIjrJicNSuH+1M6PaJUyBnnX2ekz/bOCFhho0
         gU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776669701; x=1777274501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDv8kzY/wvtJwMF42UK7u0PfDikhFNNgDHqaPIhIY5g=;
        b=ppdJUtmEaTJg4vTvrqIkQ+Zv6OD9+k/Hl//oYVmW40U3OxcBaUm3uv8jdWD4vGhzPq
         FZ7mG30HlQE9sk0wfzziDFNAcFwL4hv6y7+PwtAJGF3wjNyvT0QnktTSaqsqHTEdBAMj
         GWymDg8xsMGy7jA1d/BClcZ+Mael9ONjQYGdPmZyGdYpYNPYKZ97piG9YjW3OmmZP633
         xZ4Z3xSiTlzBmtmcVq2b3AT3h7mYd7/Nrjh0VJctJv4cs5FpIXLtRUTVGOTNqFAhsZvZ
         taT+jEjI5EPfu5lubocaYi3Ss4BRni9t5KJm3xh2N8ZyU2bSM7zqxov390gAiaJ478bL
         E7yA==
X-Forwarded-Encrypted: i=1; AFNElJ8ARDh69nKqNz6s0qmxkvpHWSFXzVH5+xp7H28tHKf3vuTDaQXAry45lpek7DQzhpMpGVisWIMSdev3NJc3@lists.linux.dev
X-Gm-Message-State: AOJu0YwcUED3OBoWkPjRfqT2eKBzWaML9nu1p1XjGWcFCZaRmGRbQ90r
	NHTbvaKjVvj1TAvZmTSPsJqQ82A0xOZ3wX34V6hNF79NDMCqar/THQ0ReaJ40jet90F9mZo6HzC
	bX9iN/v2DANaVvli26ccYX0RBHK43uvM=
X-Gm-Gg: AeBDievUSODMzRYe+w9H15GGvfe4Q3F7VBNu/TBofvgwnETignO/I1XETDOm4GlAwdU
	YqKh58AJNYYnUuV8amzD/IsXUfs3IPI14EW0r/A6USJyjoELMsIjSY+5vSt+ib/46VDEFD07GOi
	p2I6AKGV+sD11QajSQPcPULmf5H4f7/uQR7NP5dZqd8VXDPG4QplOfcF6NURFD1TCtpGYRloAcP
	fpWPO3XCNlZuq8txE7/ah3H+vC+CEtYDB65sH3DPATE8yyM1J5J9nRJMRW6U7aT/hyTQf78/qQX
	v8VSVUrw3JFK995YhICtlARVX0nEBAGvB8OQvWJwtarQmVlKrw==
X-Received: by 2002:a05:6808:bcc:b0:467:14c7:a8ae with SMTP id
 5614622812f47-4799c94d75bmr7221946b6e.21.1776669700915; Mon, 20 Apr 2026
 00:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604200606.7BHpBMyA-lkp@intel.com>
In-Reply-To: <202604200606.7BHpBMyA-lkp@intel.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Mon, 20 Apr 2026 15:21:28 +0800
X-Gm-Features: AQROBzDranaMeUZhKA4e73Rgphcfp-jFOTvP4WoH3XC-huDjGkWUMD6mLz5Udn4
Message-ID: <CACVXFVMLmH84dJ3h+1PfdfXg9BSHt=xpSSbRBzF6eOs4uNKwug@mail.gmail.com>
Subject: Re: [linux-nvme:for-next 5/19] WARNING: modpost: vmlinux: section
 mismatch in reference: swap_inode_boot_loader+0x36c (section:
 .text.swap_inode_boot_loader) -> start_dirtytime_writeback (section: .init.text)
To: kernel test robot <lkp@intel.com>
Cc: Ming Lei <ming.lei@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>, 
	Caleb Sander Mateos <csander@purestorage.com>, Jens Axboe <axboe@kernel.dk>, 
	Ming Lei <tom.leiming@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 20, 2026 at 9:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.infradead.org/nvme.git for-next
> head:   0514a1379e11c6b8038674f43a478b0857d47a5e
> commit: 139c3d972ebafdfb27d05ab33cfc3583fb98a7b2 [5/19] ublk: add helper =
of ublk_need_map_io()
> config: mips-randconfig-r071-20260419 (https://download.01.org/0day-ci/ar=
chive/20260420/202604200606.7BHpBMyA-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5=
bac06718f502014fade905512f1d26d578a18f3)
> smatch: v0.5.0-9007-gcf3ea02b
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260420/202604200606.7BHpBMyA-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202604200606.7BHpBMyA-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: vmlinux: section mismatch in reference: 0x16e8 (section=
: __ex_table) -> .L0  (section: .debug_str)
> ERROR: modpost: __ex_table+0x16e8 references non-executable section '.deb=
ug_str'

The mentioned ublk patch was merged to v6.15 as:

1d781c0de08c ublk: add helper of ublk_need_map_io()

which also shouldn't cause the failure.

Thanks,
Ming Lei
