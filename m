Content-Type: multipart/mixed; boundary="===============4189204793659132871=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not used
Date: Thu, 20 May 2021 03:01:17 +0800
Message-ID: <202105200314.TS5zUUYA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4189204793659132871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jordan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c3d0e3fd41b7f0f5d5d5b6022ab7e813f04ea727
commit: 650b55b707fdfa764e9f2b81314d3eb4216fb962 powerpc: Add prefixed inst=
ructions to instruction data type
date:   1 year ago
config: powerpc-klondike_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D650b55b707fdfa764e9f2b81314d3eb4216fb962
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 650b55b707fdfa764e9f2b81314d3eb4216fb962
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/lib/sstep.c: In function 'analyse_instr':
>> arch/powerpc/lib/sstep.c:1172:21: error: variable 'suffix' set but not u=
sed [-Werror=3Dunused-but-set-variable]
    1172 |  unsigned int word, suffix;
         |                     ^~~~~~
   arch/powerpc/lib/sstep.c:1168:31: error: variable 'rc' set but not used =
[-Werror=3Dunused-but-set-variable]
    1168 |  unsigned int opcode, ra, rb, rc, rd, spr, u;
         |                               ^~
   cc1: all warnings being treated as errors


vim +/suffix +1172 arch/powerpc/lib/sstep.c

  1153	=

  1154	/*
  1155	 * Decode an instruction, and return information about it in *op
  1156	 * without changing *regs.
  1157	 * Integer arithmetic and logical instructions, branches, and barrier
  1158	 * instructions can be emulated just using the information in *op.
  1159	 *
  1160	 * Return value is 1 if the instruction can be emulated just by
  1161	 * updating *regs with the information in *op, -1 if we need the
  1162	 * GPRs but *regs doesn't contain the full register set, or 0
  1163	 * otherwise.
  1164	 */
  1165	int analyse_instr(struct instruction_op *op, const struct pt_regs *r=
egs,
  1166			  struct ppc_inst instr)
  1167	{
  1168		unsigned int opcode, ra, rb, rc, rd, spr, u;
  1169		unsigned long int imm;
  1170		unsigned long int val, val2;
  1171		unsigned int mb, me, sh;
> 1172		unsigned int word, suffix;
  1173		long ival;
  1174	=

  1175		word =3D ppc_inst_val(instr);
  1176		suffix =3D ppc_inst_suffix(instr);
  1177	=

  1178		op->type =3D COMPUTE;
  1179	=

  1180		opcode =3D ppc_inst_primary_opcode(instr);
  1181		switch (opcode) {
  1182		case 16:	/* bc */
  1183			op->type =3D BRANCH;
  1184			imm =3D (signed short)(word & 0xfffc);
  1185			if ((word & 2) =3D=3D 0)
  1186				imm +=3D regs->nip;
  1187			op->val =3D truncate_if_32bit(regs->msr, imm);
  1188			if (word & 1)
  1189				op->type |=3D SETLK;
  1190			if (branch_taken(word, regs, op))
  1191				op->type |=3D BRTAKEN;
  1192			return 1;
  1193	#ifdef CONFIG_PPC64
  1194		case 17:	/* sc */
  1195			if ((word & 0xfe2) =3D=3D 2)
  1196				op->type =3D SYSCALL;
  1197			else
  1198				op->type =3D UNKNOWN;
  1199			return 0;
  1200	#endif
  1201		case 18:	/* b */
  1202			op->type =3D BRANCH | BRTAKEN;
  1203			imm =3D word & 0x03fffffc;
  1204			if (imm & 0x02000000)
  1205				imm -=3D 0x04000000;
  1206			if ((word & 2) =3D=3D 0)
  1207				imm +=3D regs->nip;
  1208			op->val =3D truncate_if_32bit(regs->msr, imm);
  1209			if (word & 1)
  1210				op->type |=3D SETLK;
  1211			return 1;
  1212		case 19:
  1213			switch ((word >> 1) & 0x3ff) {
  1214			case 0:		/* mcrf */
  1215				op->type =3D COMPUTE + SETCC;
  1216				rd =3D 7 - ((word >> 23) & 0x7);
  1217				ra =3D 7 - ((word >> 18) & 0x7);
  1218				rd *=3D 4;
  1219				ra *=3D 4;
  1220				val =3D (regs->ccr >> ra) & 0xf;
  1221				op->ccval =3D (regs->ccr & ~(0xfUL << rd)) | (val << rd);
  1222				return 1;
  1223	=

  1224			case 16:	/* bclr */
  1225			case 528:	/* bcctr */
  1226				op->type =3D BRANCH;
  1227				imm =3D (word & 0x400)? regs->ctr: regs->link;
  1228				op->val =3D truncate_if_32bit(regs->msr, imm);
  1229				if (word & 1)
  1230					op->type |=3D SETLK;
  1231				if (branch_taken(word, regs, op))
  1232					op->type |=3D BRTAKEN;
  1233				return 1;
  1234	=

  1235			case 18:	/* rfid, scary */
  1236				if (regs->msr & MSR_PR)
  1237					goto priv;
  1238				op->type =3D RFI;
  1239				return 0;
  1240	=

  1241			case 150:	/* isync */
  1242				op->type =3D BARRIER | BARRIER_ISYNC;
  1243				return 1;
  1244	=

  1245			case 33:	/* crnor */
  1246			case 129:	/* crandc */
  1247			case 193:	/* crxor */
  1248			case 225:	/* crnand */
  1249			case 257:	/* crand */
  1250			case 289:	/* creqv */
  1251			case 417:	/* crorc */
  1252			case 449:	/* cror */
  1253				op->type =3D COMPUTE + SETCC;
  1254				ra =3D (word >> 16) & 0x1f;
  1255				rb =3D (word >> 11) & 0x1f;
  1256				rd =3D (word >> 21) & 0x1f;
  1257				ra =3D (regs->ccr >> (31 - ra)) & 1;
  1258				rb =3D (regs->ccr >> (31 - rb)) & 1;
  1259				val =3D (word >> (6 + ra * 2 + rb)) & 1;
  1260				op->ccval =3D (regs->ccr & ~(1UL << (31 - rd))) |
  1261					(val << (31 - rd));
  1262				return 1;
  1263			}
  1264			break;
  1265		case 31:
  1266			switch ((word >> 1) & 0x3ff) {
  1267			case 598:	/* sync */
  1268				op->type =3D BARRIER + BARRIER_SYNC;
  1269	#ifdef __powerpc64__
  1270				switch ((word >> 21) & 3) {
  1271				case 1:		/* lwsync */
  1272					op->type =3D BARRIER + BARRIER_LWSYNC;
  1273					break;
  1274				case 2:		/* ptesync */
  1275					op->type =3D BARRIER + BARRIER_PTESYNC;
  1276					break;
  1277				}
  1278	#endif
  1279				return 1;
  1280	=

  1281			case 854:	/* eieio */
  1282				op->type =3D BARRIER + BARRIER_EIEIO;
  1283				return 1;
  1284			}
  1285			break;
  1286		}
  1287	=

  1288		/* Following cases refer to regs->gpr[], so we need all regs */
  1289		if (!FULL_REGS(regs))
  1290			return -1;
  1291	=

  1292		rd =3D (word >> 21) & 0x1f;
  1293		ra =3D (word >> 16) & 0x1f;
  1294		rb =3D (word >> 11) & 0x1f;
  1295		rc =3D (word >> 6) & 0x1f;
  1296	=

  1297		switch (opcode) {
  1298	#ifdef __powerpc64__
  1299		case 2:		/* tdi */
  1300			if (rd & trap_compare(regs->gpr[ra], (short) word))
  1301				goto trap;
  1302			return 1;
  1303	#endif
  1304		case 3:		/* twi */
  1305			if (rd & trap_compare((int)regs->gpr[ra], (short) word))
  1306				goto trap;
  1307			return 1;
  1308	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4189204793659132871==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
CB2pC5+bAAA=
--===============4189204793659132871==--

