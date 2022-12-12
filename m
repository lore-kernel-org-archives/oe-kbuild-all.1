Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E382653A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 18:57:05 +0000 (UTC)
Date: Mon, 12 Dec 2022 19:57:02 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julian Anastasov <ja@ssi.bg>
Cc: Jiri Wiesner <jwiesner@suse.de>, coreteam@netfilter.org,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [netfilter-core] [netfilter-nf-next:master 10/12]
 include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer
 types lacks a cast
Message-ID: <Y5d5ftKuB0WlWtXU@salvia>
References: <202212122351.pm375fNX-lkp@intel.com>
 <58fd994f-99bb-796b-bfca-f26bcb621aef@ssi.bg>
 <Y5d41uy8SINREDti@salvia>
 <Y5d5KYFYvJ8fVsSU@salvia>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y5d5KYFYvJ8fVsSU@salvia>

On Mon, Dec 12, 2022 at 07:55:37PM +0100, Pablo Neira Ayuso wrote:
> On Mon, Dec 12, 2022 at 07:54:17PM +0100, Pablo Neira Ayuso wrote:
> > On Mon, Dec 12, 2022 at 08:50:36PM +0200, Julian Anastasov wrote:
> > > 	Pablo, hope this helps to silence the warnings:
> > > 
> > > From: Julian Anastasov <ja@ssi.bg>
> > > Date: Mon, 12 Dec 2022 20:44:47 +0200
> > > Subject: [PATCH] ipvs: use u64 to silence do_div warnings
> 
> BTW, could you post this patch to netfilter-devel@ and ipvs-devel@ and
> add a description (the splat reported by the robot and a sentence
> should be fine).

Just to clarify: This last email supersedes my previous proposal, just
post it to mailing lists asap :)

Thanks.
