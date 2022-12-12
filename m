Received: from mail.netfilter.org (mail.netfilter.org [217.70.188.207])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968EB53A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Dec 2022 19:00:09 +0000 (UTC)
Date: Mon, 12 Dec 2022 19:54:14 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julian Anastasov <ja@ssi.bg>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Jiri Wiesner <jwiesner@suse.de>, coreteam@netfilter.org
Subject: Re: [netfilter-nf-next:master 10/12]
 include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer
 types lacks a cast
Message-ID: <Y5d41uy8SINREDti@salvia>
References: <202212122351.pm375fNX-lkp@intel.com>
 <58fd994f-99bb-796b-bfca-f26bcb621aef@ssi.bg>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <58fd994f-99bb-796b-bfca-f26bcb621aef@ssi.bg>

Hi Julian,

Thanks for your quick action to address this robot report.

Pull request has been sent already, I'll post as a follow up patch
once this is in the net-next tree.

On Mon, Dec 12, 2022 at 08:50:36PM +0200, Julian Anastasov wrote:
> 	Pablo, hope this helps to silence the warnings:
> 
> From: Julian Anastasov <ja@ssi.bg>
> Date: Mon, 12 Dec 2022 20:44:47 +0200
> Subject: [PATCH] ipvs: use u64 to silence do_div warnings
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Julian Anastasov <ja@ssi.bg>
> ---
>  net/netfilter/ipvs/ip_vs_est.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/net/netfilter/ipvs/ip_vs_est.c b/net/netfilter/ipvs/ip_vs_est.c
> index df56073bb282..5473328f367f 100644
> --- a/net/netfilter/ipvs/ip_vs_est.c
> +++ b/net/netfilter/ipvs/ip_vs_est.c
> @@ -638,11 +638,12 @@ static int ip_vs_est_calc_limits(struct netns_ipvs *ipvs, int *chain_max)
>  	struct ip_vs_stats *s;
>  	int cache_factor = 4;
>  	int i, loops, ntest;
> -	s32 min_est = 0;
> +	u32 min_est = 0;
>  	ktime_t t1, t2;
> -	s64 diff, val;
>  	int max = 8;
>  	int ret = 1;
> +	s64 diff;
> +	u64 val;
>  
>  	INIT_HLIST_HEAD(&chain);
>  	mutex_lock(&__ip_vs_mutex);
> -- 
> 2.38.1
> 
> 
