Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E1C2583
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BaxS9vy7XOXVo5lpnDYCfX9vKjUUzhsxirbfirjjMvc=; b=TJ17ecGpQx3uVdMERdwiaXIxCw
	EJj5Id9s6U67LflSOgR9L6ALUyIjXcQpe+jQRfUYXrdnrcUJXVYgb7gjZ3vENCM9OjQswPUs5rRUH
	iPwDc1FIE+ousWAkdxFtDsgjKy/XFeU/fH87Qxzq9o91gf1f5H1jvFoa3wHXtfKSVCPAWn1KkXFPY
	uYGodwhJB1aGyI+c+t3B7qA0DiwrjbvZ5ol/Jq2dIDB64JtivuHireNF9jtdfeqPzYhvLviy/JPtV
	Edq+CsLJjI/6Y4eE3cY/x88eXST4xqzhp0OjTA0bMX49q4nSxtBVGgq3QJeJUbXJsX8iZ++NvQQOa
	5saNYYUA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pdze1-007O9S-07;
	Sun, 19 Mar 2023 20:28:45 +0000
Date: Sun, 19 Mar 2023 13:28:45 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jason Baron <jbaron@akamai.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [mcgrof:modules-next 9/9] lib/dynamic_debug.c:857:6: warning: no
 previous prototype for '__dynamic_pr_debug'
Message-ID: <ZBdwfd/6zbwPVxfR@bombadil.infradead.org>
References: <202303111333.Rqs7rhRE-lkp@intel.com>
 <6f66fbe7-49da-a2ab-cc2c-596a572ea6c2@akamai.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f66fbe7-49da-a2ab-cc2c-596a572ea6c2@akamai.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Mar 13, 2023 at 12:21:10AM -0400, Jason Baron wrote:
> More Whack-A-Mole here. I cross-compiled to reproduce this error and seems
> like lots of functions in other files hit this warning. However, it's newly
> introduced with the latest patch added to modules-next, and thus I've sent a
> patch in reply to the thread to address it. Perhaps, it can be folded into
> the previous patch if it makes sense?

Sure I squashed it into the original patch and replaced the urldefense.com long
eye sore URLs with proper small ones.

Push to modules-next.

Thanks!

  Luis
