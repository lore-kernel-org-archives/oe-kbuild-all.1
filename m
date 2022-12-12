Received: from mg.ssi.bg (mg.ssi.bg [193.238.174.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B2653B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 20:04:53 +0000 (UTC)
Received: from mg.ssi.bg (localhost [127.0.0.1])
	by mg.ssi.bg (Proxmox) with ESMTP id A075344494;
	Mon, 12 Dec 2022 22:04:51 +0200 (EET)
Received: from ink.ssi.bg (unknown [193.238.174.40])
	by mg.ssi.bg (Proxmox) with ESMTP id 6B21844507;
	Mon, 12 Dec 2022 22:04:50 +0200 (EET)
Received: from ja.ssi.bg (unknown [178.16.129.10])
	by ink.ssi.bg (Postfix) with ESMTPS id 0E2043C07CA;
	Mon, 12 Dec 2022 22:04:49 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.17.1/8.16.1) with ESMTP id 2BCK4imr102606;
	Mon, 12 Dec 2022 22:04:44 +0200
Date: Mon, 12 Dec 2022 22:04:44 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: Pablo Neira Ayuso <pablo@netfilter.org>
cc: Jiri Wiesner <jwiesner@suse.de>, coreteam@netfilter.org,
        kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [netfilter-core] [netfilter-nf-next:master 10/12]
 include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer
 types lacks a cast
In-Reply-To: <Y5d5ftKuB0WlWtXU@salvia>
Message-ID: <a5d4a8fb-2b54-7215-8526-110485d8786@ssi.bg>
References: <202212122351.pm375fNX-lkp@intel.com> <58fd994f-99bb-796b-bfca-f26bcb621aef@ssi.bg> <Y5d41uy8SINREDti@salvia> <Y5d5KYFYvJ8fVsSU@salvia> <Y5d5ftKuB0WlWtXU@salvia>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Mon, 12 Dec 2022, Pablo Neira Ayuso wrote:

> On Mon, Dec 12, 2022 at 07:55:37PM +0100, Pablo Neira Ayuso wrote:
> > On Mon, Dec 12, 2022 at 07:54:17PM +0100, Pablo Neira Ayuso wrote:
> > > On Mon, Dec 12, 2022 at 08:50:36PM +0200, Julian Anastasov wrote:
> > > > 	Pablo, hope this helps to silence the warnings:
> > > > 
> > > > From: Julian Anastasov <ja@ssi.bg>
> > > > Date: Mon, 12 Dec 2022 20:44:47 +0200
> > > > Subject: [PATCH] ipvs: use u64 to silence do_div warnings
> > 
> > BTW, could you post this patch to netfilter-devel@ and ipvs-devel@ and
> > add a description (the splat reported by the robot and a sentence
> > should be fine).
> 
> Just to clarify: This last email supersedes my previous proposal, just
> post it to mailing lists asap :)

	Just posted it. Note that I don't see such warnings
and hope the fix is correct. Probably, I'm missing tools
to catch such warnings...

Regards

--
Julian Anastasov <ja@ssi.bg>

