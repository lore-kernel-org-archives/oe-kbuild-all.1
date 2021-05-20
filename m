Content-Type: multipart/mixed; boundary="===============4575576003853918001=="
MIME-Version: 1.0
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 3800/3829] net/netfilter/nft_set_pipapo_avx2.c:1135:10: error: implicit declaration of function 'nft_pipapo_lookup'; did you mean 'nft_pipapo_avx2_lookup'?
Date: Fri, 21 May 2021 09:09:57 +1000
Message-ID: <20210521090957.052ae180@canb.auug.org.au>
In-Reply-To: <202105201202.KwssJTLc-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4575576003853918001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 20 May 2021 12:52:05 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9f24705effef8c3b9eca00d70594ef7e0364a6da
> commit: 3b4f9530977112ddf177282e396d0715dc60b9a3 [3800/3829] fix up for m=
erge involving nft_pipapo_lookup()
> config: x86_64-randconfig-a001-20210520 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git/commit/?id=3D3b4f9530977112ddf177282e396d0715dc60b9a3
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/ke=
rnel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 3b4f9530977112ddf177282e396d0715dc60b9a3
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    net/netfilter/nft_set_pipapo_avx2.c: In function 'nft_pipapo_avx2_look=
up':
> >> net/netfilter/nft_set_pipapo_avx2.c:1135:10: error: implicit declarati=
on of function 'nft_pipapo_lookup'; did you mean 'nft_pipapo_avx2_lookup'? =
[-Werror=3Dimplicit-function-declaration]  =

>     1135 |   return nft_pipapo_lookup(net, set, key, ext);
>          |          ^~~~~~~~~~~~~~~~~
>          |          nft_pipapo_avx2_lookup
>    cc1: some warnings being treated as errors

This is caused by an incomplete merge resolution I did.  I will add the
following to the merge resolution today;

diff --git a/include/net/netfilter/nf_tables_core.h b/include/net/netfilter=
/nf_tables_core.h
index 789e9eadd76d..8652b2514e57 100644
--- a/include/net/netfilter/nf_tables_core.h
+++ b/include/net/netfilter/nf_tables_core.h
@@ -89,6 +89,8 @@ extern const struct nft_set_type nft_set_bitmap_type;
 extern const struct nft_set_type nft_set_pipapo_type;
 extern const struct nft_set_type nft_set_pipapo_avx2_type;
 =

+bool nft_pipapo_lookup(const struct net *net, const struct nft_set *set,
+			    const u32 *key, const struct nft_set_ext **ext);
 #ifdef CONFIG_RETPOLINE
 bool nft_rhash_lookup(const struct net *net, const struct nft_set *set,
 		      const u32 *key, const struct nft_set_ext **ext);
@@ -101,8 +103,6 @@ bool nft_hash_lookup_fast(const struct net *net,
 			  const u32 *key, const struct nft_set_ext **ext);
 bool nft_hash_lookup(const struct net *net, const struct nft_set *set,
 		     const u32 *key, const struct nft_set_ext **ext);
-bool nft_pipapo_lookup(const struct net *net, const struct nft_set *set,
-			    const u32 *key, const struct nft_set_ext **ext);
 bool nft_set_do_lookup(const struct net *net, const struct nft_set *set,
 		       const u32 *key, const struct nft_set_ext **ext);
 #else
diff --git a/net/netfilter/nft_set_pipapo.c b/net/netfilter/nft_set_pipapo.c
index 9addc0b447f7..dce866d93fee 100644
--- a/net/netfilter/nft_set_pipapo.c
+++ b/net/netfilter/nft_set_pipapo.c
@@ -408,7 +408,6 @@ int pipapo_refill(unsigned long *map, int len, int rule=
s, unsigned long *dst,
  *
  * Return: true on match, false otherwise.
  */
-INDIRECT_CALLABLE_SCOPE
 bool nft_pipapo_lookup(const struct net *net, const struct nft_set *set,
 		       const u32 *key, const struct nft_set_ext **ext)
 {

-- =

Cheers,
Stephen Rothwell

--===============4575576003853918001==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVOSUM5NmdpWjgx
dFdkTGdLQVZCQzgwbFgwR3dGQW1DbTdFVUFDZ2tRQVZCQzgwbFgKMEd6Qjl3ZitPNUhRNVJIcmVE
V25lQUQxSDVXSmd1VllXSk1YWjk2eWVIdFY4OFJtY3FFdmY3cWN2NmJ5TDJvZApodnl5WWZKL3dH
MlZWeXVaL3NFQkx2UURKM05QU1lXQnhld3FJUUNhVE5EVlJ6ODJaekpZMVo2V211Z0ZvMnpoCjFt
UDYyN0YrNksxc3FwTyttTzUrUU5JNUhXdDVmaEtkQ1NINFhzQVdueXVla2xOUHhoWXJxanQ5RDg0
K004QUMKZ2dTKzkyaU5uSXl3KzRpRG5YL25WTFA0UUxLdFBMWEdUZldmT00wOU8zWVU2U3JURVVE
Zzk3TjR2ZVhTdDUrcApndlFpZjdxRmIrV0k5cjg4QzJ5UjROeEUwc1d1V1VwMkNhUHZDWE1yR1Jo
MXRLVnN4ajlSWFczbjhrS0cyMENvCmlqMDNWNnljdkp2Q2JidWt6TmcyczZxTGxoS29HUT09Cj1N
N3dqCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4575576003853918001==--

