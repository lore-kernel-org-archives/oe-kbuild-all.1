Content-Type: multipart/mixed; boundary="===============8531688579163364534=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [omap-audio:peter/linux-next-wip 37/89] ERROR: switch and case should be at the same indent
Date: Thu, 21 May 2020 08:41:07 +0800
Message-ID: <20200521004106.GC15716@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8531688579163364534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   1352930850986516f555d53639f2b6a5c4f308cf
commit: dcca0275f838f287fbbfef48909d0beec92e998e [37/89] ASoC: Initial driv=
er for TAS2555 Smart Amplifier
reproduce: scripts/checkpatch.pl

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

# many are suggestions rather than must-fix

WARNING: DT bindings should be in DT schema format. See: Documentation/devi=
cetree/writing-schema.rst

WARNING: DT binding docs and includes should be a separate patch. See: Docu=
mentation/devicetree/bindings/submitting-patches.txt

WARNING: please write a paragraph that describes the config symbol fully
#145: sound/soc/codecs/Kconfig:1262:
+config SND_SOC_TAS2555

ERROR: that open brace { should be on the previous line
#397: sound/soc/codecs/tas2555.c:219:
+static const struct snd_soc_dapm_widget tas2555_dapm_widgets[] =3D
+{

ERROR: switch and case should be at the same indent
#545: sound/soc/codecs/tas2555.c:367:
+	switch (dai->id) {
+		case 0: /* ASI1 */
[...]
+		case 1: /* ASI2 */
[...]
+		case 2: /* ASI3/ASIM */
[...]
+		default:

ERROR: switch and case should be at the same indent
#594: sound/soc/codecs/tas2555.c:416:
+	switch (dai->id) {
+		case 0: /* ASI1 */
[...]
+		case 1: /* ASI2 */
[...]
+		case 2: /* ASI3/ASIM */
[...]
+		default:

ERROR: switch and case should be at the same indent
#709: sound/soc/codecs/tas2555.c:531:
+	switch (dai->id) {
+		case 0: /* ASI1 */
[...]
+		case 1: /* ASI2 */
[...]
+		case 2: /* ASI3/ASIM */
[...]
+		default:

ERROR: space required before the open parenthesis '('
#777: sound/soc/codecs/tas2555.c:599:
+	} while(count < fw->size);

WARNING: please, no space before tabs
#1000: sound/soc/codecs/tas2555.c:822:
+// ^I^Iif (i =3D=3D 0)$

WARNING: please, no space before tabs
#1001: sound/soc/codecs/tas2555.c:823:
+// ^I^I^Itas2555->supplies[i].optional =3D true;$

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1060: sound/soc/codecs/tas2555.h:1:
+/*

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8531688579163364534==--

