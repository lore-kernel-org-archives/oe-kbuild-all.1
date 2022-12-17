Received: from mail.andi.de1.cc (mail.andi.de1.cc [85.214.55.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A7236B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Dec 2022 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pyEQ92SUFDRtFeQ8iVgeKdC/j99oc86ipi+87SsZ3XY=; b=tEl/FSHoabPkBibhlklSx2mzw5
	690bHH6G1wBPHuoR4qUaks/H2IasLwVqbLf8VY1jRMRPqtFwXCfcZP7tjGiVCewriLR6NMb4V5RZK
	TZ5m8UCmntjjDaKJYiEcDFU3v5vRFp9lJpS36F4Sg0GCcAfKsj7udURA/Jhez5DX0/flnqQKx3TZ5
	bVQQlzRtlQuvPQsfc4BRaZi8tWPbHkAK2RaH6Ewu6DIziKuGN2xwE4KEULWJxDj4KC38bq78SV2Vc
	NKI1KwTOPH1nhR50CpjMSVpC2l0aUDzmmoMX6OtLTgX+E+lF9oiH/Hk1SSLG9xmmxOdup9oD0FhcD
	P9YwHiEQ==;
Received: from p200300ccff28b2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff28:b200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <andreas@kemnade.info>)
	id 1p6Xjt-0000Z0-SF; Sat, 17 Dec 2022 15:00:34 +0100
Date: Sat, 17 Dec 2022 15:00:32 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>
Subject: Re: [linux-next:master 14263/14897]
 drivers/iio/adc/twl6030-gpadc.c:955:16-23: duplicated argument to & or |
 (fwd)
Message-ID: <20221217150032.2543a815@aktux>
In-Reply-To: <f18aa1af-41dd-8929-a355-57aa19461e8@inria.fr>
References: <f18aa1af-41dd-8929-a355-57aa19461e8@inria.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)

Hi,

On Tue, 13 Dec 2022 18:09:28 +0100 (CET)
Julia Lawall <julia.lawall@inria.fr> wrote:

> Please check on line 955, which has BB_MEAS twice.
> 
which should be VAC_MEAS. But I do not have VAC access here,
so I could not check.

I will send a follow-up patch.
Thanks for reporting.

Regards,
Andreas
