Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32854671
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="rX6rdZUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF1A7C433CA;
	Thu, 30 Nov 2023 16:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701363217;
	bh=y9bDhxVg6ddrpIrVB1M92eCxiwrddi0JptrMAQilDbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rX6rdZUHhBmXPaYurFogDxIlIOfEaOy+EPxDrLo1X0ytCrCbUEWHD9p9PmhlDvoKw
	 vUbzEhUWpNxCCf75haulcGb8WErzdDoN5gGHkd5/NpfvBPAQynJlwrNnkbGh+MUm7A
	 DNx2kLzYGMceAOVfS5XsjfhlFRsYtUM1LfQ7551o=
Date: Thu, 30 Nov 2023 08:53:35 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Eric DeVolder
 <eric_devolder@yahoo.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [akpm-mm:mm-unstable 25/192] loongarch64-linux-ld:
 kexec_core.c:undefined reference to `machine_kexec'
Message-Id: <20231130085335.09e1db227e3a99e1f70e7748@linux-foundation.org>
In-Reply-To: <ZWhLFDC6vHsxNCpY@MiWiFi-R3L-srv>
References: <202311300946.kHE9Iu71-lkp@intel.com>
	<ZWhLFDC6vHsxNCpY@MiWiFi-R3L-srv>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Nov 2023 16:43:00 +0800 Baoquan He <bhe@redhat.com> wrote:

> There are several places in m68k, mips, sh architecture which have the
> similar issue. Would you prefer one patch to contain them all or
> separate patches for each architecture's fix?

Doesn't matter much.  I guess a single patch would save some electrons.

