Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2DD2E2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by verein.lst.de (Postfix, from userid 2407)
	id 19F9E6732D; Wed,  8 Nov 2023 08:32:40 +0100 (CET)
Date: Wed, 8 Nov 2023 08:32:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Christoph Hellwig <hch@lst.de>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>
Subject: Re: drivers/target/target_core_transport.c:1079:59: warning: '%s'
 directive output may be truncated writing up to 253 bytes into a
 region of size 221
Message-ID: <20231108073239.GC5277@lst.de>
References: <202311062106.HacLsl2Y-lkp@intel.com> <ZUj/USPCJ6tm/lg9@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUj/USPCJ6tm/lg9@rli9-mobl>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Nov 06, 2023 at 10:59:29PM +0800, Philip Li wrote:
> On Mon, Nov 06, 2023 at 10:01:44PM +0800, kernel test robot wrote:
> > Hi Christoph,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> Sorry for false report, kindly ignore this which is not the cause of initial warning.

It indeed isn't.  It still seems like a bug worth fixing, though.
