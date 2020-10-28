Content-Type: multipart/mixed; boundary="===============7828555154082498204=="
MIME-Version: 1.0
From: Vinod Koul <vkoul@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] dmaengine: ppc4xx: make ppc440spe_adma_chan_list static
Date: Wed, 28 Oct 2020 11:55:42 +0530
Message-ID: <20201028062542.GN3550@vkoul-mobl>
In-Reply-To: <20201019155756.21445-1-krzk@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7828555154082498204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 19-10-20, 17:57, Krzysztof Kozlowski wrote:
> The ppc440spe_adma_chan_list file-scope variable is not used outside of
> the unit so it can be made static.

Applied both, thanks

-- =

~Vinod
--===============7828555154082498204==--

