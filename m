Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE7625BF13;
	Fri,  2 Jan 2026 10:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767349588; cv=none; b=f+R0duMUNhatRDOpienqRWqjPh0ZK9Vfd960Q7LTzEcTGOlU5Eb91TEDeo+fmKMDqe0vBpBZaV4DiZL55pSF9kVFJHOjgbesAlZdlcF+T+mIUbo7cc4d3SUhm2XX1Z46lCG1UwhK+y47FppKgCtSrlxZ9QkbTE5MLXDKcCh4yfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767349588; c=relaxed/simple;
	bh=30azxWOAAJ4yWLk9o7AYKuLUkka+1WaqaJ7Vb4q3R8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVkbqSqzgOOxS/FreyArGWbft0sgYGAyt5bZOB58FToKSoVVqmvhS2LmjMP6ZqjnUYzLCln5MfNBaIVcRQZQXmrRcHhpwnTt40nA/1YD2Sq8VSXDktu5/2/Gnr9VMqZX+zLYUr+CZWMQ/8U9x35oNObtpgqFnI4CF7RC5GxRrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=THa+KV6q; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="THa+KV6q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cwSi7rOX455zffZohmEg2slNEWEJErFRqJwG1Jc5HN4=; b=THa+KV6qnh6KLdIWTw/6taiX7i
	Ut4kOvgftjQ0gPs6Eycnm7aypFLPgm9T9Lmupw3ArFM71L/v0NjnDZURQh76iruJY0WQO7EM4Te8g
	Yv1YKeOUqischYdj4IdChuRySq5m3+iZe+LkcjyvWudB3Uz/h4sY7Q7+7p5PSSkhTReJB+KQ1NOFG
	H2S3aednj16IcC2vlkrj4AXdXXJiybq3pt3flsMX365DIiNURpd//58nS0y+vxdThrANeDdyaysR9
	eOFnlRETjNk7KpIkz+1hXKcY8TejHNLz006nPkpolk9SLAfyPj5Mqr2yC7KmsGSpZVXy6WyhqimMN
	YyN4Zecg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vbcNW-00000005eYW-0yUl;
	Fri, 02 Jan 2026 10:27:30 +0000
Date: Fri, 2 Jan 2026 10:27:30 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: fs/file_attr.c:263:9: error: unexpected token, expected comma
Message-ID: <20260102102730.GH1712166@ZenIV>
References: <202601010950.QjCTROwO-lkp@intel.com>
 <20260102093114.GG1712166@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102093114.GG1712166@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Jan 02, 2026 at 09:31:14AM +0000, Al Viro wrote:
> On Thu, Jan 01, 2026 at 09:41:43AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   9528d5c091c59b408a754a1823cf0942069867cc
> > commit: 2f952c9e8fe13c6ee15c05189f1f87c1a70b866c fs: split fileattr related helpers into separate file
> > date:   6 months ago
> > config: mips-randconfig-r051-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010950.QjCTROwO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601010950.QjCTROwO-lkp@intel.com/
> 
> It has nothing whatsoever to do with the commit in question; I would be
> very surprised if the same build was not full of identical errors all
> over the place, wherever we happen to use put_user() or get_user().
> 
> Basically, you've stumbled across a mips config that breaks something
> in their asm/uaccess.h; apparently 32bit with EVA, bringing the macro
> horrors from asm-eva.h into play.

FWIW, error message is misleading - it's complaining about the stuff
coming out of inline asm; the token in question is assembler rather than
C one.

Does clang/mips even know about .set eva, seeing that it insists on examining
the inline asm for assembler validity?

Considering this

; cat >/tmp/foo.c <<'EOF'
void f(void)
{
        asm volatile(".set push\n.set eva\n.set pop");
}
EOF
; clang --target=mipsel-linux-gnu -mabi=32 -EL -march=mips32r2 -c /tmp/foo.c
/tmp/foo.c:3:27: error: unexpected token, expected comma
    3 |         asm volatile(".set push\n.set eva\n.set pop");
      |                                  ^
<inline asm>:2:9: note: instantiated into assembly here
    2 | .set eva
      |         ^
1 error generated.
;

I rather suspect that it doesn't...  FWIW, replacing clang --target=mipsel-linux-gnu
with mips-linux-gnu-gcc works as expected.  If you turn that mips32r2 into e.g.
mips32, gcc will spew
/tmp/ccGqqn3X.s: Assembler messages:
/tmp/ccGqqn3X.s:26: Warning: the `eva' extension requires MIPS32 revision 2 or greater
