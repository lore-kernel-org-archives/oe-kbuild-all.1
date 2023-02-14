Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594E015B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1676385286;
	bh=ZXcNkHTmXZwZeroL7lgkleJTHlvj0rKRQJKeJEE3pnw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Yz2x2tJbI6U7FBBnGJxTBc7iKCTUGxUF/E1T6/vV7XvXWBaDiye59KAUoJMQcTAcx
	 ycsC/O19Qw5+YigZRwXt69PnsfD9FvaNKHPhnKifeZMXUgucKqVzasDKfCYKah732I
	 i4fpO9eiouNwiAiO7X3VwXfZqz5ZivQ2UHBs1qlE=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 27CE712861B0;
	Tue, 14 Feb 2023 09:34:46 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URCRwubeaNHP; Tue, 14 Feb 2023 09:34:46 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1676385285;
	bh=ZXcNkHTmXZwZeroL7lgkleJTHlvj0rKRQJKeJEE3pnw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=KXJ6JyD5MMMk6VWOBIQqNEHpl+e7Kb7Jwj148/tVnaT8o820up8iCnsdVZoTNGM8A
	 vOAN1HhHVJCtGbpBgCDl4DLhJ7DlwYrc51fnl5dPFuKpNAcEv5ShCgWiPN281HHgHd
	 xLFwyUOYbQVT/i3go/PG5LMa1l1meLk/D3G9oL6M=
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 3C1E3128617C;
	Tue, 14 Feb 2023 09:34:45 -0500 (EST)
Message-ID: <0ef2bf50a9e7c85246268a028cf2a87fac1f0af6.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 06/11] tpm: Add full HMAC and encrypt/decrypt session
 handling code
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Ard Biesheuvel <ardb@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yujie Liu <yujie.liu@intel.com>, kernel test robot <lkp@intel.com>, 
	linux-integrity@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	keyrings@vger.kernel.org
Date: Tue, 14 Feb 2023 09:34:43 -0500
In-Reply-To: <CAMj1kXECgmUMjKZk41oeXWWQpX5wB22YtBt2CSAQzEq8SqbY_g@mail.gmail.com>
References: <20230124175516.5984-7-James.Bottomley@HansenPartnership.com>
	 <202301250706.deGvd0yq-lkp@intel.com>
	 <a588a74bb930f38c9322dd51d21661398b5e2bb8.camel@HansenPartnership.com>
	 <Y9ykeASyzhSKQCmx@yujie-X299> <Y+MNxmzlILarAlZA@kernel.org>
	 <3109ff421139af6b0d9e66a06d8399135e546fa7.camel@HansenPartnership.com>
	 <Y+nqpLm2YyYkcZ+H@kernel.org>
	 <CAMj1kXECgmUMjKZk41oeXWWQpX5wB22YtBt2CSAQzEq8SqbY_g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2023-02-14 at 14:54 +0100, Ard Biesheuvel wrote:
[...]
> and the requirement to use
> scatterlists for skciphers is especially horrid.

Just by way of irony, we do have one place that does use a two element
scatterlist.  It's how I found this bug: 95ec01ba1ef0 ("crypto: ecdh -
fix to allow multi segment scatterlists").  And that does mean I could
do with a library version of ecdh with the nist P-256 curve ... pretty
please ...

Regards,

James



